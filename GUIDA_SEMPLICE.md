# 🎯 GUIDA SEMPLICE - Ghost Protocol OS
## Per Principianti Assoluti (Anche Bambini!)

**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

---

## 📖 INDICE

1. [Cosa ti serve](#cosa-ti-serve)
2. [Passo 1: Prepara il computer](#passo-1)
3. [Passo 2: Crea la USB](#passo-2)
4. [Passo 3: Avvia Ghost Protocol OS](#passo-3)
5. [Passo 4: Usa il sistema](#passo-4)
6. [Cosa puoi fare](#cosa-puoi-fare)
7. [Problemi?](#problemi)

---

## 🎁 COSA TI SERVE

### Prima di iniziare, assicurati di avere:

✅ **Un computer** (PC o Laptop)  
✅ **Una chiavetta USB** da almeno 16GB (32GB o 64GB meglio)  
✅ **Un altro computer con Linux** per creare la USB (oppure chiedi a qualcuno di farlo per te)  
✅ **Connessione internet** stabile  
✅ **Circa 4 ore di tempo** per creare la USB la prima volta  

---

## 📝 PASSO 1: Prepara il Computer per Creare la USB

### Se hai un computer con Linux (Ubuntu/Debian):

1. **Apri il Terminale** (cerca "Terminale" nel menu)

2. **Copia e incolla questi comandi uno alla volta:**

```bash
# Installa i programmi necessari
sudo apt-get update
sudo apt-get install -y live-build live-config live-boot
```

3. **Scarica Ghost Protocol OS:**

```bash
# Vai nella cartella Desktop
cd ~/Desktop

# Scarica il progetto (se è su GitHub)
git clone https://github.com/digitalvalut-os/ghost-protocol-os.git

# Oppure se hai già i file, vai nella cartella
cd ghost-protocol-os
```

---

## 🔨 PASSO 2: Crea la USB con Ghost Protocol OS

### ⚠️ ATTENZIONE: Questo cancellerà tutto sulla USB!

1. **Inserisci la tua chiavetta USB** nel computer

2. **Scopri il nome della USB:**

```bash
# Nel terminale, scrivi:
lsblk
```

Vedrai qualcosa tipo:
```
sda   8:0   0 500G  0 disk
sdb   8:16  0  32G  0 disk  ← Questa è probabilmente la tua USB!
```

**Ricorda il nome!** (esempio: `sdb` o `sdc`)

3. **Crea Ghost Protocol OS sulla USB:**

```bash
# Vai nella cartella del progetto
cd ~/Desktop/ghost-protocol-os

# Crea il sistema (ci vogliono 2-4 ore!)
sudo ./scripts/build.sh
```

**⏰ Aspetta pazientemente!** Vedrai molti messaggi, è normale.  
**Alla fine vedrai:** "✅ BUILD SUCCESSFUL!"

4. **Scrivi sulla USB:**

```bash
# Usa lo script automatico (più facile)
sudo ./scripts/write-usb.sh

# Oppure manualmente (sostituisci sdb con il nome della TUA USB):
sudo dd if=binary/live-image-amd64.hybrid.iso of=/dev/sdb bs=4M status=progress && sync
```

**⚠️ ATTENZIONE:** Sostituisci `sdb` con il nome della TUA USB!  
**Sbagliare qui può cancellare il disco del computer!**

---

## 🚀 PASSO 3: Avvia Ghost Protocol OS

### Ora usiamo la USB!

1. **Spegni il computer** dove vuoi usare Ghost Protocol OS

2. **Inserisci la chiavetta USB**

3. **Accendi il computer**

4. **Premi subito il tasto per entrare nel menu di boot:**
   - **F12** (molti computer)
   - **F2** (alcuni computer)
   - **ESC** (alcuni computer)
   - **F10** (alcuni computer)
   
   **💡 Suggerimento:** Guarda lo schermo all'accensione, spesso dice quale tasto premere!

5. **Scegli la USB dal menu:**
   - Cerca "USB" o il nome della tua chiavetta
   - Usa le frecce ↑↓ per muoverti
   - Premi **INVIO** per scegliere

6. **Aspetta il caricamento:**
   - Vedrai il menu: **"Ghost Protocol OS v1.0 - Dr. Falsone Giuseppe ©2026"**
   - Premi **INVIO** (o aspetta 10 secondi)
   - Il sistema si caricherà (ci vogliono 1-2 minuti)

7. **Sei dentro! 🎉**
   - Il sistema si avvia automaticamente
   - Non serve password (login automatico)
   - Vedrai il **desktop con tante icone** (come Tails!)
   - Interfaccia facile e intuitiva

---

## 💻 PASSO 4: Usa il Sistema

### 🖥️ INTERFACCIA GRAFICA (Facile come Tails!)

#### **Cosa vedrai:**
- **Desktop con icone** - Tutti i programmi hanno icone!
- **Barra in alto** - Menu e WiFi
- **Facile come Windows/Mac!**

#### **Come connettersi a Internet:**

**WiFi (Super Facile!):**
1. **Guarda in alto a destra** → Vedi icona WiFi 📶
2. **Clicca sull'icona WiFi**
3. **Scegli la tua rete WiFi**
4. **Inserisci password**
5. **FATTO!** ✅ Sei connesso!

**Ethernet:**
- Collega il cavo → Si connette automaticamente! ✅

#### **Come usare Tor (Navigazione Anonima):**

1. **Doppio click su "Tor Browser"** sul desktop
2. **Aspetta 30-60 secondi** (si sta connettendo)
3. **Si apre il browser anonimo** 🌐
4. **Naviga normalmente** - sei già anonimo!

#### **Icone sul Desktop (Doppio click per aprire):**

- 🌐 **Tor Browser** - Naviga anonimo
- 🔍 **DigitalValut OSINT** - Tool AI e ricerca
- 📡 **Wireshark** - Analisi rete
- ⚔️ **Metasploit** - Pentesting
- 💻 **Terminal** - Comandi avanzati
- 📁 **File Manager** - Gestisci file
- ⚙️ **Network Settings** - Configura internet

### Comandi Super Semplici (nel Terminale):

#### 1. **Apri il Terminale**
   - Doppio click su "Terminal" sul desktop
   - Oppure premi `Ctrl + Alt + T`

#### 2. **Comandi Magici:**

**Digita questi comandi e premi INVIO:**

```bash
ghost
```
**Cosa fa:** Mostra informazioni sul sistema e il nome "Dr. Falsone Giuseppe"

```bash
dv
```
**Cosa fa:** Avvia l'app DigitalValut OSINT (strumenti di ricerca)

```bash
ai
```
**Cosa fa:** Avvia la chat AI locale

---

## 🎮 COSA PUOI FARE

### 1. **Navigare Anonimo con Tor**
   - Cerca "Tor Browser" nel menu
   - Apri e naviga in modo anonimo

### 2. **Usare DigitalValut OSINT**
   - Apri il terminale
   - Digita `dv` e premi INVIO
   - Si aprirà un browser con l'app
   - Puoi analizzare testi, immagini, blockchain

### 3. **Tool di Sicurezza**
   - Wireshark (analisi rete)
   - Nmap (scansione rete)
   - Metasploit (pentesting)
   - E molti altri!

### 4. **Wallet Blockchain**
   - Electrum (Bitcoin)
   - Monero Wallet
   - Per gestire criptovalute

---

## ❓ PROBLEMI?

### Il computer non parte dalla USB?

1. **Riprova a premere F12/F2/ESC** all'accensione
2. **Vai nel BIOS/UEFI:**
   - Spegni il computer
   - Accendi e premi F2 (o F10, dipende dal PC)
   - Cerca "Boot Order" o "Ordine di avvio"
   - Metti USB come prima opzione
   - Salva e esci (F10)

### Il sistema è lento?

- **Normale!** Sta caricando tutto in memoria
- Aspetta 2-3 minuti al primo avvio
- Serve almeno 4GB di RAM

### Non vedo il menu "Ghost Protocol OS"?

- Assicurati che la USB sia stata creata correttamente
- Riprova a creare la USB seguendo il Passo 2

### Tor non funziona?

```bash
# Nel terminale, scrivi:
sudo systemctl start tor
```

### L'app "dv" non si apre?

```bash
# Nel terminale, scrivi:
pip3 install --user streamlit
dv
```

---

## 📞 AIUTO

### Se hai problemi:

1. **Leggi la guida completa:** `docs/USER_GUIDE.md`
2. **Cerca su Google** il problema specifico
3. **Chiedi aiuto** a qualcuno che conosce Linux

---

## ✅ RIEPILOGO VELOCE

1. ✅ Prepara computer Linux
2. ✅ Crea USB con `sudo ./scripts/build.sh` (2-4 ore)
3. ✅ Scrivi su USB con `sudo ./scripts/write-usb.sh`
4. ✅ Inserisci USB nel computer
5. ✅ Avvia e premi F12
6. ✅ Scegli USB dal menu
7. ✅ Aspetta caricamento
8. ✅ Digita `ghost` per vedere "Dr. Falsone Giuseppe"
9. ✅ Digita `dv` per usare OSINT
10. ✅ Divertiti! 🎉

---

## 🎯 RICORDA

- **Dr. Falsone Giuseppe** è l'autore - vedrai il suo nome ovunque!
- **Ghost Protocol OS** è il nome del sistema
- **DigitalValut Team** ha collaborato
- **©2026** è l'anno di creazione

---

**Ghost Protocol OS v1.0**  
**Dr. Falsone Giuseppe & DigitalValut Team ©2026**

*Guida creata per essere semplice come un gioco! 🎮*

