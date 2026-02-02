# Ghost Protocol OS - Istruzioni Build Complete

**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

## 📋 Checklist Pre-Build

- [ ] Sistema Linux/Unix (Debian/Ubuntu consigliato)
- [ ] 20GB+ spazio disco libero
- [ ] 8GB+ RAM
- [ ] Connessione internet stabile
- [ ] Privilegi sudo/root

## 🔧 Installazione Dipendenze

```bash
# Debian/Ubuntu
sudo apt-get update
sudo apt-get install -y \
    live-build \
    live-config \
    live-boot \
    live-tools \
    syslinux \
    isolinux \
    xorriso \
    grub-pc-bin \
    grub-efi-amd64-bin \
    memtest86+ \
    hwinfo \
    git \
    curl \
    wget
```

## 🏗️ Processo Build

### Step 1: Clone/Setup Repository

```bash
# Se non hai ancora il repo
git clone https://github.com/digitalvalut-os/ghost-protocol-os.git
cd ghost-protocol-os

# Setup Git (se necessario)
./scripts/setup-github.sh
```

### Step 2: Build ISO

```bash
# Metodo consigliato: Makefile
sudo make build

# OPPURE script diretto
sudo ./scripts/build.sh
```

**Cosa succede:**
1. `lb config` configura live-build
2. Scarica pacchetti Debian 12 Bookworm
3. Installa tutti i tool (Metasploit, Hashcat, AI, etc.)
4. Applica hook personalizzati
5. Crea ISO hybrid (3-5GB, 2-4 ore)

**Output:** `binary/live-image-amd64.hybrid.iso`

### Step 3: Verifica ISO

```bash
# Controlla dimensione
ls -lh binary/live-image-amd64.hybrid.iso

# Dovrebbe essere 3-5GB
```

### Step 4: Scrivi su USB

```bash
# Identifica USB
lsblk

# Scrivi (sostituisci /dev/sdX)
sudo make write-usb
# OPPURE
sudo ./scripts/write-usb.sh
```

**Comando manuale:**
```bash
sudo dd if=binary/live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress && sync
```

## 🧪 Test Build

### Test ISO in VM

```bash
# QEMU/KVM
qemu-system-x86_64 -cdrom binary/live-image-amd64.hybrid.iso -m 4096

# VirtualBox
# Crea nuova VM → Scegli ISO → Avvia
```

### Test USB

1. Inserisci USB
2. Boot da USB (F12/F2/ESC)
3. Verifica menu boot "Ghost Protocol OS"
4. Login automatico (ghost/ghost)
5. Test comandi: `dv`, `ghost`, `ai`

## 📦 Struttura Repository

```
ghost-protocol-os/
├── README.md                    # Documentazione principale
├── QUICKSTART.md                # Guida rapida
├── BUILD_INSTRUCTIONS.md        # Questo file
├── Makefile                     # Build automation
├── LICENSE                      # Licenza
├── CONTRIBUTING.md              # Guida contributori
├── .gitignore                   # Git ignore rules
│
├── config/                      # Live-build configuration
│   ├── package-lists/
│   │   └── ghost.list.chroot   # Lista pacchetti
│   ├── hooks/
│   │   └── live/
│   │       └── 0100-ghost-protocol.chroot  # Hook personalizzati
│   └── bootloaders/
│       ├── syslinux/
│       │   └── isolinux.cfg     # Boot menu Syslinux
│       └── grub-pc/
│           └── grub.cfg         # Boot menu GRUB
│
├── scripts/
│   ├── build.sh                 # Script build principale
│   ├── write-usb.sh             # Script scrittura USB
│   └── setup-github.sh          # Setup repository Git
│
└── docs/
    ├── USER_GUIDE.md            # Guida utente completa
    └── ETSY_LISTING.md          # Template vendita Etsy
```

## 🔍 Troubleshooting Build

### Problema: "lb: command not found"

```bash
sudo apt-get install live-build
```

### Problema: "Out of disk space"

```bash
# Pulisci cache
sudo lb clean --purge

# Verifica spazio
df -h
```

### Problema: "Failed to download packages"

```bash
# Cambia mirror in scripts/build.sh
# Modifica: --mirror-bootstrap http://ftp.it.debian.org/debian/
```

### Problema: "Hook failed"

```bash
# Verifica permessi
chmod +x config/hooks/live/*.chroot

# Test hook manualmente
sudo chroot /path/to/chroot /path/to/hook
```

### Problema: "ISO too large"

```bash
# Rimuovi pacchetti non essenziali da config/package-lists/ghost.list.chroot
# O usa compressione
lb config --compression gzip
```

## ⚡ Build Ottimizzato

### Build Parallelo

```bash
# Aumenta parallel downloads
echo 'APT::Acquire::Queue-Mode "access";' | sudo tee /etc/apt/apt.conf.d/99parallel
```

### Cache Pacchetti

```bash
# Riutilizza cache tra build
lb config --cache true
```

## 📊 Tempi Stimati

- **Download pacchetti**: 30-60 minuti
- **Installazione**: 60-120 minuti
- **Hook personalizzati**: 10-20 minuti
- **Creazione ISO**: 20-40 minuti
- **TOTALE**: 2-4 ore

## ✅ Checklist Post-Build

- [ ] ISO creata (`binary/live-image-amd64.hybrid.iso`)
- [ ] Dimensione ISO ragionevole (3-5GB)
- [ ] Test boot in VM
- [ ] Test USB su hardware reale
- [ ] Verifica tool installati
- [ ] Test comandi: `dv`, `ghost`, `ai`
- [ ] Verifica Tor funzionante
- [ ] Documentazione aggiornata

## 🚀 Prossimi Passi

1. **Test completo** su hardware vario
2. **Ottimizzazione** dimensioni ISO
3. **Aggiornamenti** tool e sicurezza
4. **Release** su GitHub
5. **Vendita** su Etsy (vedi `docs/ETSY_LISTING.md`)

---

**Ghost Protocol OS v1.0**  
**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

