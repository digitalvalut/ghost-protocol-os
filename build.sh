#!/bin/bash
# Ghost Protocol OS - Build Script
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

set -e

echo "🚀 Building Ghost Protocol OS - Dr. Falsone Edition..."
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run as root: sudo ./build.sh"
    exit 1
fi

# Check if live-build is installed
if ! command -v lb &> /dev/null; then
    echo "📦 Installing live-build..."
    apt-get update
    apt-get install -y live-build live-config live-boot live-tools
fi

# Clean previous build
echo "🧹 Cleaning previous build..."
lb clean --purge 2>/dev/null || true

# Configure
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
  --security true

# Make hooks executable
chmod +x config/hooks/live/*.chroot 2>/dev/null || true

# Build
echo ""
echo "🔨 Building ISO (this may take 2-4 hours)..."
echo ""

lb build 2>&1 | tee ghost-protocol-build.log

# Check result
if [ -f "binary/live-image-amd64.hybrid.iso" ]; then
    ISO_SIZE=$(du -h binary/live-image-amd64.hybrid.iso | cut -f1)
    echo ""
    echo "✅ ISO pronta: binary/live-image-amd64.hybrid.iso"
    echo "📊 Dimensione: $ISO_SIZE"
    echo ""
    echo "📦 Scrivi su USB:"
    echo "   sudo dd if=binary/live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress && sync"
    echo ""
    echo "🎉 Build completato! Ghost Protocol OS pronto!"
else
    echo ""
    echo "❌ Build fallito! Controlla ghost-protocol-build.log"
    exit 1
fi

