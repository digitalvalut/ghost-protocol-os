#!/bin/bash
# Ghost Protocol OS - Comandi Pubblicazione GitHub
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

set -e

echo "🚀 Ghost Protocol OS - Pubblicazione GitHub"
echo "Dr. Falsone Giuseppe & DigitalValut Team ©2026"
echo ""

# ⚠️ AVVISO SICUREZZA
echo "⚠️  IMPORTANTE: Token GitHub esposto!"
echo "    Revoca immediatamente il token su:"
echo "    https://github.com/settings/tokens"
echo ""
read -p "Hai revocato il token e creato uno nuovo? (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "❌ Revoca prima il token esposto!"
    exit 1
fi

# Richiedi nuovo token
echo ""
read -p "Inserisci il NUOVO GitHub Personal Access Token: " NEW_TOKEN
if [ -z "$NEW_TOKEN" ]; then
    echo "❌ Token richiesto!"
    exit 1
fi

# Directory progetto
cd "/Users/cabana/Desktop/sistema operativo/ghost-protocol-os"

echo ""
echo "📋 Configurazione Git..."

# Cambia branch a main se necessario
git branch -M main 2>/dev/null || true

# Configura remote con nuovo token
git remote remove origin 2>/dev/null || true
git remote add origin "https://${NEW_TOKEN}@github.com/digitalvalut-os/ghost-protocol-os.git"

echo "✅ Remote configurato"

# Aggiungi tutti i file
echo ""
echo "📦 Aggiunta file..."
git add .

# Commit
echo ""
echo "💾 Commit..."
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

# Push
echo ""
echo "🚀 Push su GitHub..."
git push -u origin main

echo ""
echo "✅ Repository pubblicato!"
echo ""
echo "🌍 Repository: https://github.com/digitalvalut-os/ghost-protocol-os"
echo ""
echo "🎉 Ghost Protocol OS è ora open source pubblico!"

