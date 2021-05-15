#!/bin/bash

# Needed to redeclare again....
export filename="games.txt"

displaymainGenre(){
    clear
    echo "What is the main genre of your video game?"
    echo ""
    cat dictionaries/main-genres.txt
    echo ""
}

subgenre(){
    sub="${*,,}"
    clear
    subfile=dictionaries/sub-genres/$sub.txt
    echo "What subgenre does it belong to?"
    echo ""
    cat "$subfile"
    echo ""
    echo "Enter your choice, case sensitive (w/o quotations)"
    echo "Or type 'Go back' to go back to the previous menu"
    echo "Or type 'Unknown' if not shown"
    read -p "Response: " subans
    
    case $subans in
        "Go back")
            return 1
            ;;
        "Unknown")
            echo "Main genre: $*" >> $filename
            echo "Sub genre: $subans" >> $filename
            return 0
            ;;
        *)
            if grep -Fxq "$subans" "$subfile" ; then
                echo "Main genre: $*" >> $filename
                echo "Sub genre: $subans" >> $filename
                return 0
            else
                echo "Sub genre not found."
                sleep 1
                return 1
            fi
            ;;
    esac
}

genremenu(){
    while :
    do
        displaymainGenre
        read -p "Enter name: " ans
        if grep -Fxq "$ans" dictionaries/main-genres.txt; then
            if [ $ans == "Unknown" ]; then
                echo "Main genre: $ans" >> $filename
                echo "-----------------------------" >> $filename
                source ./inventory.sh
            else
                if subgenre "$ans"; then
                    echo "-----------------------------" >> $filename
                    source ./inventory.sh
                else
                    continue
                fi
            fi
        else
            echo "Invalid answer. Please try again."
            sleep 1
        fi
    done
}


if [ -f "$filename" ]; then
    genremenu
else
    echo "Please run start.sh, as file does not exist."
    exit 1
fi
