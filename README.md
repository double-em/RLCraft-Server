# RLCraft-Server
Docker image for the Forge modded server with RLCraft installed

Minimum starting command for online use:
```
docker run -p 25565:25565 rlcraft-server
```

For saving and loading worlds and configurations attach a valume to the /server/server-data
```
docker run -v rlcraft-server:/server/server-data -p 25565:25565 rlcraft-server
```
