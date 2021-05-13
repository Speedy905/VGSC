#!/bin/bash

if [ -f "$filename" ]; then
    clear
    read -p "Type in the name of your game: " gamename
    echo "Video Game: $gamename" >> $filename
    clear
    source ./platform.sh
else
    echo "Please run start.sh, as file does not exist."
    exit 1
fi
