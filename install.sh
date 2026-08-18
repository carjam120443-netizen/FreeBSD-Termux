#!/data/data/com.termux/files/usr/bin/bash

set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
BIN="$PREFIX/bin"

pkg update
pkg install -y qemu-system-aarch64-headless

chmod +x "$(dirname "$0")/freebsd-termux"
cp "$(dirname "$0")/freebsd-termux" "$BIN/freebsd-termux"

mkdir -p "$HOME/.freebsd-termux"

echo ""
echo "FreeBSD-Termux base setup complete!"
echo "Run: freebsd-termux start"
echo ""
echo "A FreeBSD ARM64 disk image is still required."
