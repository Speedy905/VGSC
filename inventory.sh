#!/bin/bash

# Create Environment Variable
export filename="games.txt"

showChoices(){
    clear
    echo "Choose the following options"
    echo "'Add' in a new game"
    echo "'Back' to the menu"
    echo "'Look' at the names of your current games"
    echo "'View' your text file (Will open with the 'less' command)"
    echo "'Clear' your text file"
}

checkFile(){
    if [ -s $filename ]; then
        return 0
    else
        return 1
fi
}

clearFile(){
    clear
    echo "WARNING!!!!!"
    echo "THIS WILL TOTALLY ERASE EVERYTHING THAT IS IN YOUR FILE!"
    read -p "ARE YOU SURE YOU WANT TO PROCEED? (y/n)" warn
    if [ $warn == "Y" ] || [ $warn == "y" ]; then
        echo "Clearing file"
        > $filename
        echo "File cleared"
    elif [ $warn == "N" ] || [ $warn == "n" ]; then
        echo "Aborting"
    else
        echo "Error"
    fi
    read -p "Press Enter to go back to the menu" blank
}

viewNames(){
    clear
    echo "Your current list:"
    grep -F "Video Game: " $filename | cut -f 2- -d : | sort
    read -p "Press Enter to go back to the menu" blank
}

displayError(){
    clear
    echo "$filename does not exist or is empty."
    read -p "Press Enter to go back to the menu" blank
}

while :
do
    showChoices
    read -p "Enter your choice (W/O Quotations, Case sensitive): " ans
    case $ans in
        "Add")
            if checkFile; then
                source ./name.sh
            else
                touch $filename
                source ./name.sh
            fi
            break
            ;;
        "Back")
            # Go back to start script
            source ./start.sh
            break
            ;;
        "Look")
            if checkFile; then
                viewNames
            else
                displayError
            fi
            ;;
        "View")
            if checkFile; then
                less $filename
            else
                displayError
            fi
            ;;
        "Clear")
            if checkFile; then
                clearFile
            else
                displayError
            fi
            ;;
        *)
            echo "Invalid choice"
            sleep 1
            ;;
    esac
done
