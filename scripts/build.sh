#!/bin/bash
# Ghost Protocol OS - Build Script
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

set -e

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   GHOST PROTOCOL OS - Build Script v1.0                 ║"
echo "║   Dr. Falsone Giuseppe & DigitalValut Team ©2026       ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run as root (sudo ./scripts/build.sh)"
    exit 1
fi

# Check if live-build is installed
if ! command -v lb &> /dev/null; then
    echo "📦 Installing live-build..."
    apt-get update
    apt-get install -y live-build live-config live-boot live-tools
fi

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

echo "📁 Project directory: $PROJECT_DIR"
echo ""

# Clean previous build
if [ -d "config" ]; then
    echo "🧹 Cleaning previous build..."
    lb clean --purge 2>/dev/null || true
fi

# Configure live-build
echo "⚙️  Configuring live-build..."
lb config \
  --distribution bookworm \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --bootloader syslinux \
  --mirror-bootstrap http://ftp.it.debian.org/debian/ \
  --mirror-chroot http://ftp.it.debian.org/debian/ \
  --mirror-binary http://ftp.it.debian.org/debian/ \
  --bootappend-live "boot=live components persistence username=ghost noeject autologin tor=true macspoof=yes" \
  --debian-installer false \
  --updates true \
  --security true \
  --backports true \
  --apt-indices false \
  --apt-recommends false \
  --memtest none

echo ""
echo "✅ Configuration complete!"
echo ""

# Copy custom configurations
echo "📋 Copying custom configurations..."
if [ -d "config" ]; then
    echo "   - Package lists"
    echo "   - Hooks"
    echo "   - Bootloader config"
fi

# Make hooks executable
chmod +x config/hooks/live/*.chroot 2>/dev/null || true
chmod +x config/hooks/normal/*.chroot 2>/dev/null || true

# Build ISO
echo ""
echo "🔨 Starting build process (this may take 2-4 hours)..."
echo "   Logging to: ghost-protocol-build.log"
echo ""

lb build 2>&1 | tee ghost-protocol-build.log

# Check if build succeeded
if [ -f "binary/live-image-amd64.hybrid.iso" ]; then
    ISO_SIZE=$(du -h binary/live-image-amd64.hybrid.iso | cut -f1)
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║   ✅ BUILD SUCCESSFUL!                                   ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo ""
    echo "📦 ISO Location: binary/live-image-amd64.hybrid.iso"
    echo "📊 ISO Size: $ISO_SIZE"
    echo ""
    echo "💾 To write to USB:"
    echo "   1. Identify USB: lsblk"
    echo "   2. Write ISO: sudo dd if=binary/live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress && sync"
    echo ""
else
    echo ""
    echo "❌ BUILD FAILED! Check ghost-protocol-build.log for details."
    exit 1
fi

