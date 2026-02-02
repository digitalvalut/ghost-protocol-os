#!/bin/bash
# Ghost Protocol OS - GitHub Setup Script
# Dr. Falsone Giuseppe & DigitalValut Team ©2026

set -e

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   GHOST PROTOCOL OS - GitHub Repository Setup           ║"
echo "║   Dr. Falsone Giuseppe & DigitalValut Team ©2026       ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
fi

# Add remote (if not exists)
if ! git remote | grep -q origin; then
    echo "🔗 Adding GitHub remote..."
    git remote add origin https://github.com/digitalvalut-os/ghost-protocol-os.git
    echo "   Remote: https://github.com/digitalvalut-os/ghost-protocol-os.git"
fi

# Add all files
echo "📝 Adding files to Git..."
git add .

# Create initial commit
if ! git log --oneline | grep -q "Initial commit"; then
    echo "💾 Creating initial commit..."
    git commit -m "Initial commit: Ghost Protocol OS v1.0

- Complete live-build configuration
- Debian 12 Bookworm base
- Privacy tools (Tor, AppArmor, MAC spoofing)
- Pentesting tools (Metasploit, Hashcat, etc.)
- AI OSINT (Streamlit, HateBERT, OCR)
- Blockchain tools (Electrum, Monero)
- Custom branding and boot configuration

Dr. Falsone Giuseppe & DigitalValut Team ©2026"
fi

echo ""
echo "✅ Git repository ready!"
echo ""
echo "📤 To push to GitHub:"
echo "   git push -u origin main"
echo ""
echo "⚠️  Note: Make sure you have:"
echo "   1. Created the repository on GitHub first"
echo "   2. Set up SSH keys or HTTPS credentials"
echo ""

