# RLCraft Server

Docker image for the Forge modded server with RLCraft installed.

## Quickstart

### Example For GCP VM

1. Create a e2-standard-2 vm with network tag `mc` using COS image
1. Add a firewall rule for port 25565 0.0.0.0/0 to target tag `mc`
1. SSH into server
```bash
cd &&
git clone https://github.com/erzz/RLCraft-Server.git
docker build -t rl:latest .
mkdir ~/data
docker run -dit -e EULA=true -v ~/data:/server/server-data -p 25565:25565 rl:latest
```
**NOTE**: By providing EULA=TRUE you agree to the EULA at https://account.mojang.com/documents/minecraft_eula.

## Environment Variables
- EULA (Required)
  - Default: none
- RAM - Sets the dedicated RAM (java -Xms, -Xmx)
  - Default: 4G

## References
- JVM Parameters<br>
  https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/
- Crontab<br>
  https://www.adminschoice.com/crontab-quick-reference
