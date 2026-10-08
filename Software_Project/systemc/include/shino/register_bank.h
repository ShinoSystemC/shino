#pragma once
#include <cstddef>
#include <cstdint>
#include <string>

namespace shino {
struct RegisterSlot {
  std::uint32_t value;
  std::uint32_t request;
  std::uint32_t response;
  std::uint32_t operation;
};

class RegisterBank {
 public:
  RegisterBank(const char* name, std::size_t aperture);
  ~RegisterBank();
  RegisterBank(const RegisterBank&) = delete;
  RegisterBank& operator=(const RegisterBank&) = delete;
  RegisterSlot& slot(std::uint32_t offset);
  std::size_t slots() const { return count_; }
 private:
  std::string name_;
  int fd_ = -1;
  RegisterSlot* data_ = nullptr;
  std::size_t count_ = 0;
};

class SharedBytes {
 public:
  SharedBytes(const char* name, std::size_t size);
  ~SharedBytes();
  std::uint8_t* data() { return data_; }
 private:
  std::string name_;
  int fd_ = -1;
  std::uint8_t* data_ = nullptr;
  std::size_t size_ = 0;
};
}  // namespace shino
