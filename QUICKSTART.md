# Ghost Protocol OS - Quick Start

## 🚀 Build Rapido (Linux/Unix)

### 1. Prerequisiti

```bash
# Su Debian/Ubuntu
sudo apt-get update
sudo apt-get install -y live-build live-config live-boot live-tools \
    syslinux isolinux xorriso grub-pc-bin grub-efi-amd64-bin
```

### 2. Clone Repository

```bash
git clone https://github.com/digitalvalut-os/ghost-protocol-os.git
cd ghost-protocol-os
```

### 3. Build ISO

```bash
# Metodo 1: Usa Makefile
make install-deps
sudo make build

# Metodo 2: Script diretto
sudo ./scripts/build.sh
```

**Tempo stimato**: 2-4 ore (dipende da connessione e CPU)

### 4. Scrivi su USB

```bash
# Identifica USB
lsblk

# Scrivi ISO (sostituisci /dev/sdX)
sudo make write-usb
# OPPURE
sudo ./scripts/write-usb.sh
```

## 💻 Uso

1. **Boot da USB** (F12/F2/ESC al boot)
2. **Seleziona "Ghost Protocol OS"**
3. **Login automatico** (utente: `ghost`, password: `ghost`)
4. **Digita `dv`** per avviare DigitalValut OSINT

## 📖 Documentazione Completa

Vedi `docs/USER_GUIDE.md` per guida dettagliata.

## ⚠️ Note

- **RAM minima**: 4GB (8GB consigliato)
- **Spazio disco per build**: 20GB+
- **ISO finale**: 3-5GB
- **USB richiesta**: 16-64GB

---

**Ghost Protocol OS v1.0**  
**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

