# RLCraft-Server
Docker image for the Forge modded server with RLCraft installed.

***NOTE!: Image has accepted the EULA by default. Please read and understand https://account.mojang.com/documents/minecraft_eula before using the image. By using the image you confirm you have read and accepted the EULA.***

Minimum starting command for online use:
```
docker run -p 25565:25565 rlcraft-server
```

For saving and loading worlds and configurations attach a valume to the /server/server-data path, like so:
```
docker run -v rlcraft-server:/server/server-data -p 25565:25565 rlcraft-server
```
