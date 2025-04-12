# Information
An Italian translation of https://github.com/gb-mobile/pokecrystal-mobile-eng
This translation was performed via text dumps and a (somewhat) sophisticated find/replace script and some manual effort.

## Screenshots
![image](https://github.com/user-attachments/assets/e1442d4b-c7e9-48ae-a670-a9b8fcd73ca0)
![image](https://github.com/user-attachments/assets/2d350a72-7a8d-4e8f-80e9-0d2fbefabde2)
![image](https://github.com/user-attachments/assets/28767055-5745-4074-943a-34941d5872d5)
![image](https://github.com/user-attachments/assets/53c11d55-a1f7-4c0e-9131-a4a52da69fd8)
![image](https://github.com/user-attachments/assets/e1cd7ebc-5a99-4729-a0cd-ecba3842cee4)
![image](https://github.com/user-attachments/assets/f63e4fcf-8556-4fc5-9a49-21a23e4dacfe)
![image](https://github.com/user-attachments/assets/2d1a70ec-8a46-4b54-81d3-46f0a526b360)
![image](https://github.com/user-attachments/assets/b8ffbd9c-e76b-49d8-b603-36823ea49e8d)
![image](https://github.com/user-attachments/assets/9acb6268-302d-4f64-8834-69c8d54aaa37)
![image](https://github.com/user-attachments/assets/6b59640c-e0ed-4bf0-a9a3-4c1547df38b3)
![image](https://github.com/user-attachments/assets/32fce5c7-4ecf-4c38-96ed-c2930cde3988)
![image](https://github.com/user-attachments/assets/91e4fafb-f66d-4dfc-b119-7bb45e5d7795)
![image](https://github.com/user-attachments/assets/dddcf398-d118-4925-9517-192c59082538)
![image](https://github.com/user-attachments/assets/345a699f-96a3-478c-864b-e7caf023659d)
![image](https://github.com/user-attachments/assets/ec408381-9c7a-48f2-985c-b6aeda997296)


## Setup [![Build Status][ci-badge]][ci]

For more information, please see [INSTALL.md](INSTALL.md)

After setup has been completed, you can choose which version you wish to build.
To build a specific version, run this command inside the repository directory in cygwin64:

`make`


Other languages can be found here:

https://github.com/gb-mobile/pokecrystal-mobile-eng

https://github.com/gb-mobile/pokecrystal-mobile-fra

https://github.com/gb-mobile/pokecrystal-mobile-ger

https://github.com/gb-mobile/pokecrystal-mobile-spa

## Using Mobile Adapter Features

To take advantage of the Mobile Adapter features, we currently recommend the GameBoy Emulator BGB:
https://bgb.bircd.org/

and libmobile-bgb:
https://github.com/REONTeam/libmobile-bgb/releases

Simply open BGB, right click the ‘screen’ and select `Link > Listen`, then accept the port it provides by clicking `OK`.
Once done, run the latest version of libmobile for your operating system (`mobile-windows.exe` or windows and `mobile-linux` for linux).
Now right click the ‘screen’ on BGB again and select `Load ROM…`, then choose the pokecrystal-mobile `.gbc` file you have built.

## Mobile Adapter Features

A full list of Mobile Adapter features for Pokémon Crystal can be found here:
https://github.com/gb-mobile/pokecrystal-mobile-en/wiki/Pok%C3%A9mon-Crystal-Mobile-Features

## Contributors

- Pret           : Initial disassembly
- Matze          : Mobile Restoration & Japanese Code Disassembly
- Lorenzooone    : Italian Mobile Translation & Code
- 95Girl         : Italian Mobile Translation
- RainbowMPigeon : Italian Mobile Translation
- swagfello      : Italian Mobile Translation
- Damien         : Code
- DS             : GFX & Code
- Ryuzac         : Code & Japanese Translation
- Zumilsawhat?   : Code (Large amounts of work on the EZ Chat system)
- REON Community : Support and Assistance

[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
