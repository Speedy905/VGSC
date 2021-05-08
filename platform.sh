#!/bin/sh

displaybrand(){
    clear
    echo "What brand does your video game belong on? (For more choices, type in the last option)"
    echo "'Microsoft'"
    echo "'Nintendo'"
    echo "'Sony'"
    echo "'None'"
}

platforms(){
    # Lowercase the first character
    plat=${1,}
    clear
    echo "What console does it belong to?"
    cat dictionaries/platforms/$plat.txt
    echo "Enter your choice, case sensitive"
    echo "Or type '-Go back-'"
    echo "W/O Quotations to go back to the previous menu"
    read -p "Response: " consplat
    
    if [ $consplat == "-Go back-" ]; then
        return
    elif grep -q "$consplat" "$filename" ; then
        echo "It exists"
    else
        "No"
    fi
}

while :
do
    displaybrand
    read -p "Enter your choice (W/O Quotations, Case sensitive): " ans
    case $ans in
        "Microsoft")
            platforms $ans
            break
            ;;
        "Nintendo")
            break
            ;;
        "Sony")
            break
            ;;
        "None")
            break
            ;;
        *)
            echo "Invalid choice"
            sleep 1
            ;;
    esac
done
