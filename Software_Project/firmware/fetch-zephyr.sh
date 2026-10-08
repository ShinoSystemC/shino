#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
deps=${SHINO_DEPS:-"$root/.deps"}
revision=bbbf8b30094dacd0d6830946ba206bcec8af6b0c
mkdir -p "$deps"
if [ ! -d "$deps/zephyr/.git" ]; then
  git init "$deps/zephyr"
  git -C "$deps/zephyr" remote add origin https://github.com/zephyrproject-rtos/zephyr
fi
if ! git -C "$deps/zephyr" cat-file -e "$revision^{commit}" 2>/dev/null; then
  git -C "$deps/zephyr" fetch --depth 1 origin "$revision"
fi
current=$(git -C "$deps/zephyr" rev-parse HEAD 2>/dev/null || true)
if [ "$current" != "$revision" ]; then
  git -C "$deps/zephyr" checkout --detach "$revision"
fi
if git -C "$deps/zephyr" apply --reverse --check "$root/firmware/zephyr-mmu.patch" 2>/dev/null; then
  printf '%s\n' "Zephyr MMU patch already applied"
else
  git -C "$deps/zephyr" apply --check "$root/firmware/zephyr-mmu.patch"
  git -C "$deps/zephyr" apply "$root/firmware/zephyr-mmu.patch"
fi
printf '%s\n' "Zephyr ready at $deps/zephyr"
