# 🚀 Setup GitHub - Ghost Protocol OS
## Configurazione Token e Pubblicazione

**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

---

## ⚠️ SICUREZZA TOKEN

**IMPORTANTE:** Hai esposto un GitHub Personal Access Token!

### 🔒 Azioni Immediate:

1. **Revoca il token esposto:**
   - Vai su: https://github.com/settings/tokens
   - Trova il token che inizia con `ghp_5CfDza3p...`
   - Clicca "Revoke"

2. **Crea un nuovo token:**
   - Vai su: https://github.com/settings/tokens/new
   - Nome: "Ghost Protocol OS"
   - Scadenza: 90 giorni (o No expiration)
   - Permessi: `repo` (tutti)
   - Genera e copia il nuovo token

---

## 🔧 CONFIGURAZIONE GIT CON TOKEN

### Metodo 1: URL con Token (Temporaneo)

```bash
cd ghost-protocol-os

# Configura remote con token
git remote set-url origin https://ghp_NUOVO_TOKEN@github.com/digitalvalut-os/ghost-protocol-os.git

# Oppure se non esiste ancora:
git remote add origin https://ghp_NUOVO_TOKEN@github.com/digitalvalut-os/ghost-protocol-os.git
```

### Metodo 2: Git Credential Helper (Consigliato)

```bash
# Salva credenziali in modo sicuro
git config --global credential.helper store

# Al primo push, inserisci:
# Username: digitalvalut-os (o tuo username)
# Password: ghp_NUOVO_TOKEN
```

### Metodo 3: SSH Key (Più Sicuro)

```bash
# Genera SSH key
ssh-keygen -t ed25519 -C "ghost-protocol-os"

# Aggiungi a GitHub
cat ~/.ssh/id_ed25519.pub
# Copia e incolla su: https://github.com/settings/keys

# Configura remote SSH
git remote set-url origin git@github.com:digitalvalut-os/ghost-protocol-os.git
```

---

## 📋 COMANDI COMPLETI PER PUBBLICARE

### Se Git non è ancora inizializzato:

```bash
cd "/Users/cabana/Desktop/sistema operativo/ghost-protocol-os"

# 1. Inizializza Git
git init -b main

# 2. Configura remote (USA IL NUOVO TOKEN!)
git remote add origin https://ghp_NUOVO_TOKEN@github.com/digitalvalut-os/ghost-protocol-os.git

# 3. Aggiungi tutti i file
git add .

# 4. Commit iniziale
git commit -m "Ghost Protocol OS v1.0 - Dr. Falsone Giuseppe - Open Source Launch

- Complete live-build configuration
- Debian 12 Bookworm base
- Extreme security & anonymity
- Privacy tools (Tor, AppArmor, MAC spoofing)
- Pentesting tools (Metasploit, Hashcat, etc.)
- AI OSINT (Streamlit, HateBERT, OCR)
- Blockchain tools (Electrum, Monero)
- Anonymous email (Thunderbird + Enigmail)
- Secure messaging (Signal, Element, Briar)
- Local AI (Ollama, GPT4All - no cloud)
- Anti-forensics (secure deletion, RAM wiping)
- Custom branding and boot configuration
- Multilanguage documentation (IT/EN/ES/FR/DE)

Dr. Falsone Giuseppe & DigitalValut Team ©2026"

# 5. Push su GitHub
git push -u origin main
```

### Se Git è già inizializzato:

```bash
cd "/Users/cabana/Desktop/sistema operativo/ghost-protocol-os"

# Verifica stato
git status

# Aggiungi file nuovi/modificati
git add .

# Commit
git commit -m "Ghost Protocol OS v1.0 - Open Source Launch"

# Push (usa il nuovo token!)
git push -u origin main
```

---

## 🔐 SICUREZZA TOKEN

### ✅ Best Practices:

1. **Non committare mai token** in file
2. **Usa .gitignore** per file sensibili
3. **Revoca token esposti** immediatamente
4. **Usa SSH keys** quando possibile
5. **Limita permessi token** al minimo necessario

### 📝 .gitignore già configurato:

Il file `.gitignore` esclude già:
- File di build
- Log
- ISO
- Cache

---

## ✅ VERIFICA POST-PUBBLICAZIONE

Dopo il push, verifica:

1. **Repository pubblico:**
   - https://github.com/digitalvalut-os/ghost-protocol-os

2. **File presenti:**
   - README.md
   - LICENSE
   - CONTRIBUTING.md
   - build.sh
   - config/

3. **GitHub Actions:**
   - Build automatico attivo

---

## 🎯 PROSSIMI PASSI

1. ✅ **Revoca token esposto**
2. ✅ **Crea nuovo token**
3. ✅ **Configura Git**
4. ✅ **Push repository**
5. ✅ **Crea Release v1.0**
6. ✅ **Promuovi repository**

---

**Ghost Protocol OS v1.0**  
**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

*Sicurezza prima di tutto!* 🔒

