#!/bin/bash
npm install
# Install fontconfig
apt-get update
apt-get install -y fontconfig
# Create directories for fontconfig cache
mkdir -p /home/site/fontconfig/cache
# Copy the font.conf file to a persistent location
cp /home/site/wwwroot/dist/apps/backend-api/config/font.conf /home/site/fontconfig/font.conf
# Set environment variables for fontconfig
export FONTCONFIG_FILE=/home/site/fontconfig/font.conf
export FONTCONFIG_PATH=/home/site/wwwroot/dist/apps/backend-api/app-fonts
# Rebuild Sharp to pick up fontconfig changes
cd /home/site/wwwroot/dist/apps/backend-api
npm rebuild sharp
# Rebuild font cache
fc-cache -f -v