#!/bin/sh

AVAIL_RAM=4G

if [ ! -d "world" ] && [ -d "server-data" ]; then
     echo "Copying previous data..."
     cp -Rfv server-data/* .
fi

# Parameters from aikar's post:
# https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/
java -Xms${AVAIL_RAM} -Xmx${AVAIL_RAM} \
     -XX:+UseG1GC -XX:+ParallelRefProcEnabled \
     -XX:MaxGCPauseMillis=200 \
     -XX:+UnlockExperimentalVMOptions \
     -XX:+DisableExplicitGC \
     -XX:+AlwaysPreTouch \
     -XX:G1NewSizePercent=30 \
     -XX:G1MaxNewSizePercent=40 \
     -XX:G1HeapRegionSize=8M \
     -XX:G1ReservePercent=20 \
     -XX:G1HeapWastePercent=5 \
     -XX:G1MixedGCCountTarget=4 \
     -XX:InitiatingHeapOccupancyPercent=15 \
     -XX:G1MixedGCLiveThresholdPercent=90 \
     -XX:G1RSetUpdatingPauseTimePercent=5 \
     -XX:SurvivorRatio=32 \
     -XX:+PerfDisableSharedMem \
     -XX:MaxTenuringThreshold=1 \
     -jar server.jar nogui

if [ -d "world" ] && [ -d "server-data" ]; then
     echo "Copying to volume..."
     cp -Rfv world server.properties ops.json whitelist.json banned-ips.json banned-players.json server-data/
fi