/* SPDX-License-Identifier: Apache-2.0 */
#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>
#include <zephyr/sys/sys_io.h>
#include <stdint.h>

#define CDMA_BASE 0x80000000u
#define CDMA_STATUS (CDMA_BASE + 0x04u)
#define CDMA_SOURCE (CDMA_BASE + 0x18u)
#define CDMA_DESTINATION (CDMA_BASE + 0x20u)
#define CDMA_LENGTH (CDMA_BASE + 0x28u)
#define CDMA_IDLE (1u << 1)
#define CDMA_MEM 0x82000000u

#define CONV_BASE 0x80010000u
#define CONV_INDEX (CONV_BASE + 0x00u)
#define CONV_DATA (CONV_BASE + 0x04u)
#define CONV_STATUS (CONV_BASE + 0x08u)
#define CONV_DONE ((1u << 1) | (1u << 2))
#define CONV_MEM 0xa0000000u
#define CONV_KERNEL 0x00000u
#define CONV_IMAGE 0x10000u
#define CONV_RESULT 0x20000u

static inline uint64_t guest_ticks(void)
{
	uint64_t value;
	__asm__ volatile("mrs %0, cntvct_el0" : "=r"(value));
	return value;
}

static inline uint64_t guest_hz(void)
{
	uint64_t value;
	__asm__ volatile("mrs %0, cntfrq_el0" : "=r"(value));
	return value;
}

static uint32_t checksum(const volatile uint8_t *data, uint32_t length)
{
	uint32_t value = 0;
	for (uint32_t i = 0; i < length; ++i) value = value * 33u + data[i];
	return value;
}

static void cdma_submit(uint32_t source, uint32_t destination, uint32_t length)
{
	sys_write32(source, CDMA_SOURCE);
	sys_write32(destination, CDMA_DESTINATION);
	sys_write32(length, CDMA_LENGTH);
}

static int cdma_wait(uint32_t *reads, uint32_t *busy)
{
	for (uint32_t i = 0; i < 1000000u; ++i) {
		uint32_t status = sys_read32(CDMA_STATUS);
		++*reads;
		if (status & CDMA_IDLE) return 1;
		++*busy;
	}
	return 0;
}

static void run_cdma(void)
{
	volatile uint8_t *const memory = (volatile uint8_t *)(uintptr_t)CDMA_MEM;
	const uint32_t source = CDMA_MEM;
	const uint32_t destination = CDMA_MEM + 0x10000u;
	const uint32_t length = 4096u;
	for (uint32_t i = 0; i < length; ++i) memory[i] = (uint8_t)(i * 17u + 3u);
	const uint32_t expected = checksum(memory, length);

	uint32_t reads = 0, busy = 0, buggy = 0, fixed = 0, payload = 0;
	uint64_t begin = guest_ticks();
	for (uint32_t run = 0; run < 1000u; ++run) {
		for (uint32_t i = 0; i < length; ++i) memory[0x10000u + i] = 0x5au;
		cdma_submit(source, destination, length);
		if (checksum(memory + 0x10000u, length) != expected) ++buggy;
		if (!cdma_wait(&reads, &busy)) ++fixed;
		if (checksum(memory + 0x10000u, length) != expected) ++fixed;
	}
	uint64_t end = guest_ticks();
	for (uint32_t i = 0; i < length; ++i)
		if (memory[0x10000u + i] != (uint8_t)(i * 17u + 3u)) ++payload;

	uint32_t window_success = 0;
	for (uint32_t run = 0; run < 100u; ++run) {
		for (uint32_t i = 0; i < length; ++i) memory[0x10000u + i] = 0x5au;
		cdma_submit(source, destination, length);
		uint32_t state = run + 1u;
		for (uint32_t i = 0; i < 16384u; ++i) state = state * 1664525u + 1013904223u;
		__asm__ volatile("" : "+r"(state) :: "memory");
		if ((sys_read32(CDMA_STATUS) & CDMA_IDLE) && memory[0x10000u] == 3u)
			++window_success;
		(void)cdma_wait(&reads, &busy);
	}
	printk("SHINO_CDMA guest_ticks=%llu timer_hz=%llu runs=1000 bytes=4096 reads=%u busy=%u window_runs=100 window_successes=%u buggy_output_failures=%u fixed_transfer_failures=%u payload_errors=%u ok=%u\n",
	       end - begin, guest_hz(), reads, busy, window_success, buggy, fixed,
	       payload, fixed == 0u && payload == 0u ? 1u : 0u);
}

static int32_t conv_reference(const volatile int32_t *mem, uint32_t y, uint32_t x)
{
	int32_t sum = 0;
	for (uint32_t ky = 0; ky < 3u; ++ky)
		for (uint32_t kx = 0; kx < 3u; ++kx)
			sum += mem[CONV_IMAGE / 4u + (y + ky) * 10u + x + kx] *
			       mem[CONV_KERNEL / 4u + ky * 3u + kx];
	return sum;
}

static void conv_write(uint32_t index, uint32_t value)
{
	sys_write32(index, CONV_INDEX);
	sys_write32(value, CONV_DATA);
}

static inline void poll_work(uint32_t *state)
{
	for (uint32_t i = 0; i < CONFIG_SHINO_POLL_WORK; ++i)
		*state = *state * 1664525u + 1013904223u;
	__asm__ volatile("" : "+r"(*state) :: "memory");
}

static void run_convolution(void)
{
	volatile int32_t *const mem = (volatile int32_t *)(uintptr_t)CONV_MEM;
	for (uint32_t i = 0; i < 9u; ++i) mem[CONV_KERNEL / 4u + i] = (int32_t)(i % 3u) - 1;
	for (uint32_t i = 0; i < 100u; ++i) mem[CONV_IMAGE / 4u + i] = (int32_t)((i * 7u) % 23u) - 11;
	conv_write(1u, 10u); conv_write(2u, 10u); conv_write(5u, 0u); conv_write(6u, 0u);
	uint32_t reads = 0, busy = 0, buggy = 0, fixed = 0, early = 0;
	uint64_t begin = guest_ticks();
	for (uint32_t run = 0; run < 1000u; ++run) {
		for (uint32_t i = 0; i < 64u; ++i) mem[CONV_RESULT / 4u + i] = 0x5a5a5a5a;
		conv_write(4u, 1u);
		if (mem[CONV_RESULT / 4u] == 0x5a5a5a5a) ++buggy; else ++early;
		uint32_t poll_state = run + 1u;
		for (uint32_t i = 0; i < 1000000u; ++i) {
			uint32_t status = sys_read32(CONV_STATUS); ++reads;
			if ((status & CONV_DONE) == CONV_DONE) break;
			++busy;
			poll_work(&poll_state);
			if (i == 999999u) ++fixed;
		}
		for (uint32_t y = 0; y < 8u; ++y)
			for (uint32_t x = 0; x < 8u; ++x)
				if (mem[CONV_RESULT / 4u + y * 8u + x] != conv_reference(mem, y, x)) ++fixed;
		conv_write(7u, 0u);
	}
	uint64_t end = guest_ticks();
	printk("SHINO_CONV guest_ticks=%llu timer_hz=%llu runs=1000 width=10 height=10 kernel=3 macs=900000 poll_work=%u reads=%u busy=%u buggy_output_failures=%u fixed_output_failures=%u predeadline_changes=%u status=%u ok=%u\n",
	       end - begin, guest_hz(), CONFIG_SHINO_POLL_WORK, reads, busy, buggy, fixed, early,
	       sys_read32(CONV_STATUS), fixed == 0u && early == 0u ? 1u : 0u);
}

int main(void)
{
#ifdef CONFIG_SHINO_CONV_WORKLOAD
	run_convolution();
#else
	run_cdma();
#endif
	for (;;) k_sleep(K_FOREVER);
	return 0;
}
