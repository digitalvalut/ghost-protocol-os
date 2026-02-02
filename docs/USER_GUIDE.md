# Ghost Protocol OS - Guida Utente

**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

## 🚀 Avvio Rapido

### Primo Avvio

1. **Inserisci la USB** nel computer
2. **Avvia dal BIOS/UEFI** (F12, F2, ESC - dipende dal PC)
3. **Seleziona "Ghost Protocol OS"** dal menu di boot
4. Attendi il caricamento (90-120 secondi)
5. **Login automatico** come utente `ghost` (password: `ghost`)

### Desktop

Al primo avvio vedrai:
- **Desktop** con icona "DigitalValut OSINT"
- **Terminal** pre-configurato
- **Tor Browser** disponibile

## 💻 Comandi Essenziali

### Comandi Rapidi

```bash
dv          # Avvia DigitalValut OSINT app (Streamlit)
ghost       # Mostra info sistema e branding
ai          # Chat AI locale
osint       # Apri directory OSINT app
```

### DigitalValut OSINT App

L'app principale include:

1. **AI Text Analysis** - Analisi testi con HateBERT
2. **Image OCR** - Riconoscimento testo da immagini
3. **Blockchain Explorer** - Query wallet e transazioni
4. **Network Tools** - Integrazione con Nmap, Wireshark

**Avvio:**
```bash
dv
```
Poi apri browser su: `http://localhost:8501`

## 🔒 Privacy & Sicurezza

### Tor Browser

```bash
# Avvia Tor Browser
torbrowser-launcher

# Verifica connessione Tor
curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org
```

### MAC Address Spoofing

Automatico all'avvio. Per cambiare manualmente:
```bash
sudo macchanger -r eth0
sudo macchanger -r wlan0
```

### Full Disk Encryption

Per abilitare persistenza criptata:
1. Al boot, seleziona opzione "Persistence"
2. Crea partizione criptata al primo avvio
3. Password richiesta ad ogni boot

## 🛠️ Tool Pentesting

### Metasploit Framework

```bash
sudo msfconsole
```

### Hashcat (GPU Cracking)

```bash
hashcat -m 0 hash.txt wordlist.txt
```

### Nmap (Network Scanning)

```bash
sudo nmap -sS -sV target.com
```

### Wireshark

```bash
sudo wireshark
```

## 🤖 AI & OSINT

### Chat AI Locale

```bash
ai
```

### OCR da Immagine

```bash
tesseract image.png output.txt
```

### Analisi Testo con HateBERT

Usa l'app DigitalValut OSINT o:
```python
python3 -c "from transformers import pipeline; c=pipeline('text-classification', model='unitary/toxic-bert'); print(c('test text'))"
```

## 💰 Blockchain

### Electrum Wallet

```bash
electrum
```

### Monero Wallet

```bash
monero-wallet-gui
```

## 📝 Note Importanti

### Persistenza

- **RAM-only**: Tutti i dati in RAM, zero tracce su disco
- **Persistence**: Opzionale, richiede partizione dedicata

### Aggiornamenti

```bash
update-ghost  # Aggiorna sistema e tool
```

### Troubleshooting

**Problema**: Tor non si connette
```bash
sudo systemctl restart tor
```

**Problema**: WiFi non funziona
```bash
sudo nmcli device wifi connect "SSID" password "PASSWORD"
```

**Problema**: App Streamlit non si avvia
```bash
pip3 install --user streamlit
streamlit run /opt/ghost/app/app.py
```

## ⚠️ Disclaimer

Questo sistema è per:
- ✅ Test di sicurezza autorizzati
- ✅ Ricerca e educazione
- ✅ OSINT legale
- ❌ Attività illegali

L'uso non autorizzato è illegale. L'autore non è responsabile per uso improprio.

## 📞 Supporto

Per supporto tecnico:
- GitHub Issues: https://github.com/digitalvalut-os/ghost-protocol-os
- Email: support@digitalvalut.com

---

**Ghost Protocol OS v1.0**  
**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

