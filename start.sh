#!/bin/bash

# Antonio Karlo Mijares
# Video Game Storage Creator rewritten in bash
# Why? I was curious to see if I could make this work
# This will follow the previous assignment's structure (At least, for the most part)


echo "--------------------------------------------------------------"
echo "Welcome to the Video Game Storage Creator, rewritten in bash!"
echo " __   _____ ___  ___" 
echo " \ \ / / __/ __|/ __|"
echo "  \ V / (_ \__ \ (__ "
echo "   \_/ \___|___/\___|"
echo "--------------------------------------------------------------"

Displaychoices(){
    echo "--------------------------------"
    echo "Choose the following options:"
    echo "Start to Start the Creation"
    echo "Help to display Help/Instructions"
    echo "Quit to quit the creation"
    echo "Credits to view the credits"
    echo "--------------------------------"
}

while :
do
    Displaychoices
    read -p "Enter your choice (Case sensitive): " ans
    case $ans in
        "Start")
            echo "S"
            break
            ;;
        "Help")
            echo "H"
            break
            ;;
        "Quit")
            echo "Q"
            break
            ;;
        "Credits")
            echo "C"
            break
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
