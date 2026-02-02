#!/bin/bash
# Ghost Protocol OS - USB Writer Script
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

set -e

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   GHOST PROTOCOL OS - USB Writer                        ║"
echo "║   Dr. Falsone Giuseppe & DigitalValut Team ©2026       ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "❌ Please run as root (sudo ./scripts/write-usb.sh)"
    exit 1
fi

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
ISO_FILE="$PROJECT_DIR/binary/live-image-amd64.hybrid.iso"

# Check if ISO exists
if [ ! -f "$ISO_FILE" ]; then
    echo "❌ ISO file not found: $ISO_FILE"
    echo "   Please build the ISO first: sudo ./scripts/build.sh"
    exit 1
fi

echo "📦 ISO found: $ISO_FILE"
ISO_SIZE=$(du -h "$ISO_FILE" | cut -f1)
echo "📊 ISO Size: $ISO_SIZE"
echo ""

# List available block devices
echo "🔍 Available block devices:"
echo ""
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
echo ""

# Ask for device
read -p "Enter USB device (e.g., /dev/sdb): " USB_DEVICE

if [ -z "$USB_DEVICE" ]; then
    echo "❌ No device specified"
    exit 1
fi

# Safety check
if [[ "$USB_DEVICE" == /dev/sda* ]] || [[ "$USB_DEVICE" == /dev/nvme0n1* ]]; then
    read -p "⚠️  WARNING: This might be your system disk! Are you sure? (yes/no): " CONFIRM
    if [ "$CONFIRM" != "yes" ]; then
        echo "❌ Aborted"
        exit 1
    fi
fi

# Check if device exists
if [ ! -b "$USB_DEVICE" ]; then
    echo "❌ Device $USB_DEVICE not found"
    exit 1
fi

# Unmount if mounted
echo "🔌 Unmounting $USB_DEVICE..."
umount "${USB_DEVICE}"* 2>/dev/null || true

# Confirm
echo ""
echo "⚠️  WARNING: This will ERASE all data on $USB_DEVICE"
read -p "Continue? (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "❌ Aborted"
    exit 1
fi

# Write ISO
echo ""
echo "📝 Writing ISO to $USB_DEVICE..."
echo "   This may take 10-30 minutes depending on USB speed..."
echo ""

dd if="$ISO_FILE" of="$USB_DEVICE" bs=4M status=progress oflag=sync

# Sync
echo ""
echo "💾 Syncing..."
sync

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   ✅ USB WRITE COMPLETE!                                 ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "🎉 Ghost Protocol OS is ready on $USB_DEVICE"
echo ""
echo "📖 Next steps:"
echo "   1. Safely eject the USB"
echo "   2. Boot from USB on target system"
echo "   3. Enjoy Ghost Protocol OS!"
echo ""

