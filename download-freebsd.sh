#!/data/data/com.termux/files/usr/bin/bash

set -e

PROJECT_DIR="$HOME/.freebsd-termux"
ARCH="aarch64"
VERSION="15.1-RELEASE"
BASE_URL="https://download.freebsd.org/releases/VM-IMAGES/${VERSION}/${ARCH}/Latest"
IMAGE_NAME="FreeBSD-${VERSION}-arm64-aarch64-ufs.raw.xz"
CHECKSUM_FILE="CHECKSUM.SHA256"
ARCHIVE="$PROJECT_DIR/$IMAGE_NAME"
DISK="$PROJECT_DIR/freebsd.img"

mkdir -p "$PROJECT_DIR"

for cmd in curl xz sha256sum; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd"
    echo "Install it with: pkg install curl xz coreutils"
    exit 1
  fi
done

echo "==> Downloading FreeBSD ${VERSION} ARM64 UFS VM image..."
curl -fL --progress-bar "$BASE_URL/$IMAGE_NAME" -o "$ARCHIVE"

echo "==> Downloading SHA256 checksums..."
curl -fL --progress-bar "$BASE_URL/$CHECKSUM_FILE" -o "$PROJECT_DIR/$CHECKSUM_FILE"

echo "==> Verifying SHA256 checksum..."
EXPECTED="$(awk -v f="$IMAGE_NAME" '$2 == f || $2 == "./" f {print $1; exit}' "$PROJECT_DIR/$CHECKSUM_FILE")"

if [ -z "$EXPECTED" ]; then
  echo "Could not find checksum for $IMAGE_NAME"
  exit 1
fi

ACTUAL="$(sha256sum "$ARCHIVE" | awk '{print $1}')"

if [ "$EXPECTED" != "$ACTUAL" ]; then
  echo "Checksum verification FAILED."
  echo "Expected: $EXPECTED"
  echo "Actual:   $ACTUAL"
  rm -f "$ARCHIVE"
  exit 1
fi

echo "Checksum OK."

echo "==> Extracting FreeBSD disk image..."
rm -f "$DISK"
xz -dc "$ARCHIVE" > "$DISK"
chmod 600 "$DISK"
rm -f "$ARCHIVE" "$PROJECT_DIR/$CHECKSUM_FILE"

echo ""
echo "FreeBSD ${VERSION} ARM64 image installed successfully!"
echo "Disk: $DISK"
echo "Run: freebsd-termux start"
