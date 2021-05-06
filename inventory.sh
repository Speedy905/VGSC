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
                sleep 0.5
            fi
            ;;
        "Clear")
            clearFile
            break
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
