#!/data/data/com.termux/files/usr/bin/bash

set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
BIN="$PREFIX/bin"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

pkg update
pkg install -y qemu-system-aarch64-headless curl xz coreutils

chmod +x "$SCRIPT_DIR/freebsd-termux" "$SCRIPT_DIR/download-freebsd.sh"
cp "$SCRIPT_DIR/freebsd-termux" "$BIN/freebsd-termux"
cp "$SCRIPT_DIR/download-freebsd.sh" "$BIN/freebsd-termux-download"

mkdir -p "$HOME/.freebsd-termux"

echo ""
echo "FreeBSD-Termux setup complete!"
echo "Run: freebsd-termux install"
echo "Then: freebsd-termux start"
echo ""
echo "The install command downloads and SHA256-verifies the FreeBSD ARM64 VM image."
