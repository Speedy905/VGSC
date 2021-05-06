#!/bin/sh

# Antonio Karlo Mijares
# Video Game Storage Creator rewritten in shell
# Why? I was curious to see if I could make this work
# This will follow the previous assignment's structure (At least, for the most part)

initalstart(){
    clear
    echo "--------------------------------------------------------------"
    echo "Welcome to the Video Game Storage Creator, rewritten in Shell!"
    echo " __   _____ ___  ___" 
    echo " \ \ / / __/ __|/ __|"
    echo "  \ V / (_ \__ \ (__ "
    echo "   \_/ \___|___/\___|"
    echo "--------------------------------------------------------------"
}

Displaychoices(){
    echo "--------------------------------"
    echo "Choose the following options:"
    echo "'Start' to Start the Creation"
    echo "'Help' to display Help/Instructions"
    echo "'Quit' to quit the creation"
    echo "'Credits' to view the credits"
    echo "--------------------------------"
}

showHelp(){
    clear
    echo "This creates your 'shelf',"
    echo "creating your video game collection"
    echo "You can:"
    echo "a) Read the text file"
    echo "b) View how many games you have"
    echo "c) Clear your text file"
    read -p "Press Enter to go back to the menu" blank
    clear
}

showCredits(){
    clear
    echo "A rewrite of Video Game Storage Creator in Shell"
    sleep 1
    echo "Made by Antonio Karlo Mijares"
    sleep 1
    echo "Licensed under MIT License"
    sleep 1
    clear
}

while :
do
    initalstart
    Displaychoices
    read -p "Enter your choice (W/O Quotations, Case sensitive): " ans
    case $ans in
        "Start")
            source ./inventory.sh
            break
            ;;
        "Help")
            showHelp
            ;;
        "Quit")
            echo "Exiting program. Goodbye!"
            exit 0
            ;;
        "Credits")
            showCredits
            ;;
        *)
            echo "Invalid choice"
            sleep 1
            ;;
    esac
done
