#!/bin/bash

VERSION="4"

## --help and --version options

case "$1" in
    --help) 
        echo "qwer - A terminal tool used to clear the terminal, return 'ls', current time, working directory path, machine name, and current user all at once in a user firendly view"
        echo "" 
        echo "Usage: qwer"
        echo ""
        echo "Key:"
        echo "┌──(([machine_name]@[current user])([time in AM/PM format]))-[[current directory path]]
└─ls
[Directories and files in current directory]"
        echo ""
        echo "Options:"
        echo "  --help - Show this message"
        echo "  --version - Show version number"
        echo "Uninstall:"
        echo "Navigate to the 'qwer' directory"
        echo "Run 'bash uninstall.sh'"
        exit 0
        ;;
    --version)
        echo "qwer: V$VERSION"
        exit 0
        ;;
esac                


#Function to convert 24-hour time to 12 AM/PM hour format without seconds
convert_time() {
    full_time=$(date +"%T")

    hour=$(echo "$full_time" | cut -d ':' -f 1)
    minute=$(echo "$full_time" | cut -d ':' -f 2)

    if [ "$hour" -gt 12 ]; then
        hour=$((hour - 12))
        pm_am="PM"
    elif [ "$hour" -eq 0 ]; then
        hour=12
        pm_am="PM"
    else
        pm_am="AM"
    fi

    echo "$hour:$minute $pm_am"
}

#Finds name of machine and curent user
find_machn_user(){
    user=$(whoami)
    machine=$(hostname -s)
    echo "$user@$machine"
}


#calling time functions
time=$(convert_time)

machn_user=$(find_machn_user)

#stores curent directory in variable
crnt_dir=$(pwd)

#Making it all work:

#clears text from terminal
clear

#prints out time and current directory
echo "┌──(($machn_user)($time))-[$crnt_dir]
└─ls"

#lists all files and dirs
ls