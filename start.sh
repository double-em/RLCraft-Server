#!/bin/sh

MINECRAFT_VER=1.12.2
FORGE_VER=14.23.5.2838

echo "Downloading Forge..."
FORGE_URL=https://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VER}-${FORGE_VER}/forge-${MINECRAFT_VER}-${FORGE_VER}-installer.jar
wget "$FORGE_URL" -O installer.jar

echo "Downloading RLCraft..."
RLCRAFT_URL=$(curl https://addons-ecs.forgesvc.net/api/v2/addon/nothing/file/2935323/download-url)
wget "$RLCRAFT_URL" -O rlcraft.zip
unzip -q rlcraft.zip
rm -rf rlcraft.zip
