# Informazioni
Una traduzione italiana di https://github.com/gb-mobile/pokecrystal-mobile-eng
Il progetto parte dalla traduzione Italiana di Pokémon Crystal Mobile, un'hack rom che ripristina tutte le funzionalità del Mobile Adapter GB dalla versione giappponese.
https://github.com/gb-mobile/pokecrystal-mobile-ita

Su questa base cerca di migliorare ogni aspetto del gioco ad eccezione delle meccaniche del battling, mantenendo la compatibilità con Crystal Mobile e i giochi precedenti.
Per ulteriori informazioni aprire il file [CHANGELOG.txt](Changelog.txt)
Ulteriori informazioni su come sfruttare il Mobile System GB sul server Discord: https://discord.gg/akpYgUZ526.
Mira ad essere una 4° versione della 2° gen, il progetto è ancora in beta ma completo, è possibile giocare attraverso il setup assembly.

## Screenshots
![image](https://github.com/user-attachments/assets/e1442d4b-c7e9-48ae-a670-a9b8fcd73ca0)
![image](https://github.com/user-attachments/assets/2d350a72-7a8d-4e8f-80e9-0d2fbefabde2)
![image](https://github.com/user-attachments/assets/28767055-5745-4074-943a-34941d5872d5)
![image](https://github.com/user-attachments/assets/53c11d55-a1f7-4c0e-9131-a4a52da69fd8)
![image](https://github.com/user-attachments/assets/e1cd7ebc-5a99-4729-a0cd-ecba3842cee4)
![image](https://github.com/user-attachments/assets/f63e4fcf-8556-4fc5-9a49-21a23e4dacfe)
![image](https://github.com/user-attachments/assets/04faa686-0f0e-4b0b-bb70-33e5c5d9c33c)
![image](https://github.com/user-attachments/assets/b8ffbd9c-e76b-49d8-b603-36823ea49e8d)
![image](https://github.com/user-attachments/assets/9acb6268-302d-4f64-8834-69c8d54aaa37)
![image](https://github.com/user-attachments/assets/7d101c5e-c798-46c8-bc37-fac0e03bc146)
![image](https://github.com/user-attachments/assets/32fce5c7-4ecf-4c38-96ed-c2930cde3988)
![image](https://github.com/user-attachments/assets/a25ca4f8-c2e0-4a73-91c6-f6abbe2a9f51)
![image](https://github.com/user-attachments/assets/dddcf398-d118-4925-9517-192c59082538)
![image](https://github.com/user-attachments/assets/345a699f-96a3-478c-864b-e7caf023659d)
![image](https://github.com/user-attachments/assets/ec408381-9c7a-48f2-985c-b6aeda997296)


## Setup [![Build Status][ci-badge]][ci]

Per ulteriori informazioni, guardare [INSTALL.md](INSTALL.md)

Una volta che il setup è stato completato, puoi inviare un comando per assemblare.
Esegui questo comando nella cartella del repository su cygwin64:

`make crystal11 -j$(nproc --ignore=1)`


Altre lingue possono essere trovate qui:

https://github.com/gb-mobile/pokecrystal-mobile-eng

https://github.com/gb-mobile/pokecrystal-mobile-fra

https://github.com/gb-mobile/pokecrystal-mobile-ger

https://github.com/gb-mobile/pokecrystal-mobile-spa

## Utilizzare le Funzionalità del Mobile Adapter GB

Per sfruttare le Funzionalità del Mobile Adapter GB, è consigliabile al momento l'emulatore per GameBoy BGB:
https://bgb.bircd.org/

e libmobile-bgb:
https://github.com/REONTeam/libmobile-bgb/releases

## Funzionalità del Mobile Adapter GB

Una lista completa delle Funzionalità del Mobile Adapter GB per Pokémon Cristallo possono essere trovate qui:
https://github.com/gb-mobile/pokecrystal-mobile-en/wiki/Pok%C3%A9mon-Crystal-Mobile-Features

## Collaboratori

- Pret           : Disassembly iniziale
- Matze          : Ripristino Mobile & Disassemblaggio del Codice Giapponese
- Lorenzooone    : Traduzione Italiana Mobile & Codice
- 95Girl         : Traduzione Italiana Mobile
- RainbowMPigeon : Traduzione Italiana Mobile
- swagfello      : Traduzione Italiana Mobile e Codice di Crystal Reborn
- Damien         : Codice
- DS             : GFX & Codice
- Ryuzac         : Codice & Traduzione Giapponese
- Zumilsawhat?   : Codice (La maggior parte del lavoro sul sistema di EZ Chat)
- REON Community : Supporto e Assistenza

[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
