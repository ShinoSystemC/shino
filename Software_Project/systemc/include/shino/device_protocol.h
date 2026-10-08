#pragma once
#include <cstddef>
#include <cstdint>

namespace shino {
constexpr std::uint64_t kCdmaBase = 0x80000000ULL;
constexpr std::uint64_t kCdmaSize = 0x10000ULL;
constexpr std::uint64_t kCdmaMemoryBase = 0x82000000ULL;
constexpr std::size_t kCdmaMemorySize = 1U << 20;
constexpr std::uint64_t kConvBase = 0x80010000ULL;
constexpr std::uint64_t kConvSize = 0x1000ULL;
constexpr std::uint64_t kConvMemoryBase = 0xa0000000ULL;
constexpr std::size_t kConvMemorySize = 1U << 20;

constexpr std::uint32_t kCdmaStatus = 0x04;
constexpr std::uint32_t kCdmaSource = 0x18;
constexpr std::uint32_t kCdmaDestination = 0x20;
constexpr std::uint32_t kCdmaLength = 0x28;
constexpr std::uint32_t kCdmaCommit = 0x2c;
constexpr std::uint32_t kCdmaIdle = 1U << 1;
constexpr std::uint32_t kCdmaError = 1U << 4;

constexpr std::uint32_t kConvIndex = 0x00;
constexpr std::uint32_t kConvData = 0x04;
constexpr std::uint32_t kConvStatus = 0x08;
constexpr std::uint32_t kConvCommit = 0x0c;
constexpr std::uint32_t kConvComputeDone = 1U << 1;
constexpr std::uint32_t kConvResultDone = 1U << 2;
constexpr std::uint32_t kConvKernel = 0x00000;
constexpr std::uint32_t kConvImage = 0x10000;
constexpr std::uint32_t kConvResult = 0x20000;

constexpr const char* kCdmaRegisters = "/shino_cdma_registers";
constexpr const char* kCdmaMemory = "/shino_cdma_memory";
constexpr const char* kConvRegisters = "/shino_conv_registers";
constexpr const char* kConvMemory = "/shino_conv_memory";
constexpr const char* kTransport = "/shino_qemu_transport";
}  // namespace shino
