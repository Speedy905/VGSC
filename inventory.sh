#!/bin/sh

# Create Environment Variable
export filename="games.txt"

showChoices(){
    clear
    echo "Choose the following options"
    echo "'Add' in a new game"
    echo "'Back' to the menu"
    echo "'Look' at the names of your current games"
    echo "'View' your text file "
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

while :
do
    showChoices
    read -p "Enter your choice (W/O Quotations, Case sensitive): " ans
    case $ans in
        "Add")
            echo "A"
            break
            ;;
        "Back")
            # Go back to start script
            source ./start.sh
            break
            ;;
        "Look")
            checkFile
            ;;
        "View")
            if checkFile; then
                less $filename
            else
                clear
                echo "$filename does not exist or is empty."
                read -p "Press Enter to go back to the menu" blank
            fi
            ;;
        "Clear")
            if checkFile; then
                clearFile
            else
                clear
                echo "$filename does not exist or is empty."
                read -p "Press Enter to go back to the menu" blank
            fi
            ;;
        *)
            echo "Invalid choice"
            sleep 1
            ;;
    esac
done
