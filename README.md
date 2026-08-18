# FreeBSD-Termux

A FreeBSD emulator/virtual machine project for **Termux on Android**. 🐡📱

## About

FreeBSD-Termux aims to make it easier to run a real FreeBSD environment from Termux using QEMU system emulation. The project is currently under development.

## Quick start

```bash
git clone https://github.com/carjam120443-netizen/FreeBSD-Termux.git
cd FreeBSD-Termux
bash install.sh
freebsd-termux install
freebsd-termux start
```

The installer sets up the required QEMU package and creates the FreeBSD-Termux data directory.

> 🚧 **Current development build:** `freebsd-termux install` prepares the image location, but automatic FreeBSD image downloading and checksum verification are not enabled yet. A compatible FreeBSD ARM64 raw disk image must currently be placed at `~/.freebsd-termux/freebsd.img`.

## Commands

```text
freebsd-termux install   Prepare/install the FreeBSD environment
freebsd-termux start     Start FreeBSD in QEMU
freebsd-termux stop      Show how to exit the foreground VM
freebsd-termux restart   Restart the VM
freebsd-termux remove    Remove the FreeBSD disk image
```

## Goals

- Run FreeBSD from Termux
- Provide a simple launcher and setup process
- Support persistent FreeBSD virtual disks
- Automatically download and verify compatible FreeBSD ARM64 images
- Make QEMU configuration as easy as possible

> 🚧 **Work in progress:** Features and implementation are still being developed.
