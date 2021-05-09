#!/bin/sh

# For some reasaon, I have to redeclare this variable
# every once in a while, even though its already set as a
# environment variable. If i don't have this, the script won't
# continue
export filename="games.txt"

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
    platfile=dictionaries/platforms/$plat.txt
    echo "What console does it belong to?"
    cat $platfile
    echo "Enter your choice, case sensitive"
    echo "Or type 'Go back'"
    echo "W/O Quotations to go back to the previous menu"
    read -p "Response: " consplat
    
    case $consplat in
        "Go back")
            return 1
            ;;
        *)
            if grep -q "$consplat" "$platfile" ; then
                echo "Platform: $consplat" >> $filename
                return 0
            else
                echo "No"
            fi
            ;;
    esac
    
}

nocategory(){
    clear
    echo "Which platform does the video game belong to?"
    cat dictionaries/platforms/nocategories.txt
}

while :
do
    displaybrand
    read -p "Enter your choice (W/O Quotations, Case sensitive): " ans
    case $ans in
        "Microsoft" | "Nintendo" | "Sony")
            if platforms $ans; then
                break
            else
                continue
            fi
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
