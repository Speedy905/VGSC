#!/bin/sh

clear
read -p "Type in the name of your game: " gamename
echo "Video game: $gamename" >> $filename
clear
source ./platform.sh
