# Ghost Protocol OS - Makefile
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

.PHONY: help build clean write-usb install-deps

help:
	@echo "╔══════════════════════════════════════════════════════════╗"
	@echo "║   GHOST PROTOCOL OS - Build System                      ║"
	@echo "║   Dr. Falsone Giuseppe & DigitalValut Team ©2026       ║"
	@echo "╚══════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "Available targets:"
	@echo "  make install-deps  - Install build dependencies"
	@echo "  make build         - Build Ghost Protocol OS ISO"
	@echo "  make clean         - Clean build artifacts"
	@echo "  make write-usb      - Write ISO to USB (interactive)"
	@echo "  make help          - Show this help"
	@echo ""

install-deps:
	@echo "Installing build dependencies..."
	sudo apt-get update
	sudo apt-get install -y live-build live-config live-boot live-tools \
		syslinux isolinux xorriso grub-pc-bin grub-efi-amd64-bin \
		memtest86+ hwinfo

build:
	@echo "Starting build..."
	sudo ./scripts/build.sh

clean:
	@echo "Cleaning build artifacts..."
	sudo lb clean --purge || true
	rm -f *.log
	rm -rf binary/ cache/ .chroot/ config/

write-usb:
	@echo "Starting USB writer..."
	sudo ./scripts/write-usb.sh

