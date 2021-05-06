#!/bin/sh

# Create Environment Variable
export filename="games"

showChoices(){
    clear
    echo "Choose the following options"
    echo "'Add' in a new game"
    echo "'Back' to the menu"
    echo "'Look' at the names of your current games"
    echo "'View' your text file "
    echo "'Clear' your text file"
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
            ;;
        "Look")
            echo "L"
            ;;
        "View")
            echo "V"
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
