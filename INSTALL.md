# Istruzioni

Queste istruzioni spiegano come installare i tools richiesti per assemblare  **pokecrystal**, incluso [**rgbds**](https://github.com/gbdev/rgbds), che ricostruisce il codice sorgente in una ROM.

Se riscontri problemi, chiedi aiuto su Discord (vedi [README.md](README.md)).


## Windows Subsystem for Linux (WSL)

Scarica e installa [**Windows Subsystem for Linux**](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Quindi apri il **terminale WSL**.

Aggiorna i software WSL prima di continuare. Se scegli Debian, Ubuntu, o un'altra distribuzione che utilizza `apt-get`, allora inserisci questo comando:

```bash
apt-get update && apt-get upgrade
```

WSL ha il suo file di sistema che non è accessibile da Windows, ma i file di Windows *sono* accessibili da WSL. Quindi andrai a buildare pokecrystal in Windows. Dovrai cambiare la **cartella corrente** ogni volta che aprirai WSL.

Per esempio, se vuoi salvare pokecrystal in **C:\Users\\*\<user>*\Desktop**, esegui questo comando:

```bash
cd /mnt/c/Users/<user>/Desktop
```

(Il disco `C:\` di Windows si chiama `/mnt/c/` in WSL. Rimpiazza *\<user>* nel percorso di esempio con il tuo nome utente.)

Se ciò funziona, allora segui [le istruzioni per **Linux**](#linux) sotto per qualsiasi distribuzione che hai installato per WSL.

Altrimenti, continua leggendo sotto per [le istruzioni per Windows](#windows-Qualsiasi-versione).


## Windows (Qualsiasi versione)

Scarica [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** per Windows 64-bit, **setup-x86.exe** per 32-bit.

Apri il setup e lascia le impostazioni di default. Allo step "**Select Packages**", scegli di installare i seguenti, ognuno di essi nella categoria "**Devel**":

- `make`
- `git`
- `gcc-core`

Doppio click sul testo che dice "**Skip**" davanti a ogni pacchetto per selezionare la versione più recente da installare.

Poi segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#pre-built) per Windows con Cygwin per installare **rgbds 0.6.1**.

**Note:** Se già possiedi un'installazione di rgbds più vecchia di 0.6.0, dovrai aggiornarla a 0.6.0 o 0.6.1. Ignora questa se non hai mai installato rgbds prima. Se una versione più nuova della 0.6.1 non funziona, scarica 0.6.1.

Ora apri il **terminale di Cygwin** e inserisci i seguenti comandi.

Cygwin ha il suo file di sistema dentro Windows, su **C:\cygwin64\home\\*\<user>***. Se non vuoi salvare pokecrystal quì, dovrai cambiare la **cartella corrente** ogni volta che apri Cygwin.

Per esempio, se vuoi salvare pokecrystal in **C:\Users\\*\<user>*\Desktop**:

```bash
cd /cygdrive/c/Users/<user>/Desktop
```

(Il disco `C:\` di Windows si chiama `/cygdrive/c/` su Cygwin. Rimpiazza  *\<user>* nel percorso di esempio con il tuo nome utente.)

Ora sei pronto per [buildare **pokecrystal**](#buildare-pokecrystal).


## macOS

Installa [**Homebrew**](https://brew.sh/). Segui le istruzioni ufficiali.

Apri **Terminal** e preparati a inserire comandi.

Dopo segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#pre-built) di macOS per installare **rgbds 0.6.1**.

Ora sei pronto per [buildare **pokecrystal**](#buildare-pokecrystal).


## Linux

Apri **Terminal** e inserisci i seguenti comandi, in base alla distro che usi.

### Debian o Ubuntu

per installare i software richiesti per **pokecrystal**:

```bash
sudo apt-get install make gcc git
```

Quindi segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#building-from-source) per buildare **rgbds 0.6.1** dal codice sorgente.

### OpenSUSE

Per installare il software richiesto per **pokecrystal**:

```bash
sudo zypper install make gcc git
```

Quindi segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#building-from-source) per buildare **rgbds 0.6.1** dal codice sorgente.

### Arch Linux

Per installare il software richiesto per **pokecrystal**:

```bash
sudo pacman -S make gcc git rgbds
```

Quindi segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#pre-built) di Arch Linux per installare **rgbds 0.6.1**.

Se vuoi compilare e installare **rgbds** manualmente, allora segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#building-from-source) per buildare **rgbds 0.6.1** dal codice sorgente.

### Termux

Per installare il software richiesto per **pokecrystal**:

```bash
sudo apt install make clang git sed
```

per installare **rgbds**:

```bash
sudo apt install rgbds
```

Se vuoi compilare e installare **rgbds** manualmente, allora segui le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#building-from-source) per buildare **rgbds 0.6.1** dal codice sorgente.

### Altre distro

Se la tua distro non è stata elencata quì, prova a cercare i software richiesti nei suoi repository:

- `make`
- `gcc` (or `clang`)
- `git`
- `rgbds`

Se `rgbds` non è disponibile, dovrai seguire le [istruzioni di **rgbds**](https://rgbds.gbdev.io/install#building-from-source) per buildare **rgbds 0.6.1** dal codice sorgente.

Ora sei pronto per [buildare **pokecrystal**](#buildare-pokecrystal).


## Buildare pokecrystal

Per scaricare i file sorgente di **Pokemon Crystal Reborn ita**:

```bash
git clone https://github.com/swagfello00/Pokemon-Crystal-Reborn-ita
cd Pokemon-Crystal-Reborn-ita
```

Per buildare **pokecrystal.gbc**:

```bash
make -j$(nproc --ignore=1)
```

Per buildare **pokecrystal11.gbc** (consigliato):

```bash
make crystal11 -j$(nproc --ignore=1)
```

### Build con una versione locale di rgbds

Se hai progetti differenti che richiedono versioni diverse di `rgbds`, potrebbe non essere conveniente installare rgbds 0.6.1 globalmente. Invece, puoi inserire i suoi file in una cartella dentro pokecrystal, tipo `pokecrystal/rgbds-0.6.1/`. Poi specificala quando esegui `make`:

```bash
make RGBDS=rgbds-0.6.1/ -j$(nproc --ignore=1)
```

```bash
make RGBDS=rgbds-0.6.1/ crystal11 -j$(nproc --ignore=1)
```
