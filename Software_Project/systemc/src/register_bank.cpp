#include "shino/register_bank.h"
#include <cerrno>
#include <cstring>
#include <fcntl.h>
#include <stdexcept>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

namespace shino {
namespace {
void* create_map(const char* name, std::size_t size, int* fd) {
  shm_unlink(name);
  *fd = shm_open(name, O_RDWR | O_CREAT | O_EXCL, 0600);
  if (*fd < 0 || ftruncate(*fd, static_cast<off_t>(size)) != 0)
    throw std::runtime_error(std::string("shared memory: ") + std::strerror(errno));
  void* p = mmap(nullptr, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0);
  if (p == MAP_FAILED) throw std::runtime_error("shared memory mapping");
  std::memset(p, 0, size);
  return p;
}
}
RegisterBank::RegisterBank(const char* name, std::size_t aperture)
    : name_(name), count_(aperture / 4) {
  data_ = static_cast<RegisterSlot*>(create_map(name, count_ * sizeof(RegisterSlot), &fd_));
}
RegisterBank::~RegisterBank() {
  if (data_) munmap(data_, count_ * sizeof(RegisterSlot));
  if (fd_ >= 0) close(fd_);
  shm_unlink(name_.c_str());
}
RegisterSlot& RegisterBank::slot(std::uint32_t offset) { return data_[offset / 4]; }
SharedBytes::SharedBytes(const char* name, std::size_t size) : name_(name), size_(size) {
  data_ = static_cast<std::uint8_t*>(create_map(name, size, &fd_));
}
SharedBytes::~SharedBytes() {
  if (data_) munmap(data_, size_);
  if (fd_ >= 0) close(fd_);
  shm_unlink(name_.c_str());
}
}  // namespace shino
