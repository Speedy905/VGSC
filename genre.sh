#!/bin/sh

# Needed to redeclare again....
export filename="games.txt"

displaymainGenre(){
    clear
    echo "What is the main genre of your video game?"
    cat dictionaries/main-genres.txt
}


genremenu(){
    while :
    do
        displaymainGenre
        read -p "Enter name: " ans
        if grep -Fxq "$ans" dictionaries/main-genres.txt; then
            if [ $ans == "Unknown" ]; then
                echo "$ans" >> $filename
                echo "-----------------------------" >> $filename
                source ./inventory.sh
            fi
        else
            echo "Invalid answer. Please try again."
        fi
    done
}


if [ -f "$filename" ]; then
    genremenu
else
    echo "Please run start.sh, as file does not exist."
    exit 1
fi
