#!/bin/bash

VERSION="3"

## --help and --version options

case "$1" in
    --help) 
        echo "qwer - A tool to clear terminal and return 'ls', the current time, and working directory all at once in a user firendly view" 
        echo "Usage: qwer"
        echo ""
        echo "Options:"
        echo "  --help - Show this message"
        echo "  --version - Show version number"
        echo "Uninstall:"
        echo "Navegate to the qwer directory"
        echo "Run 'bash uninstall.sh'"
        exit 0
        ;;
    --version)
        echo "qwer: V$VERSION"
        exit 0
        ;;
esac                


#Function to convert 24-hour time to 12-hour format without seconds
convert_tim() {
    #Get current time in HH:MM:SS format
    full_time=$(date +"%T")

    #Extract hour and minute
    hour=$(echo "$full_time" | cut -d ':' -f 1)
    minute=$(echo "$full_time" | cut -d ':' -f 2)

    #Convert to 12-hour format
    if [ "$hour" -gt 12 ]; then
        hour=$((hour - 12))
    elif [ "$hour" -eq 0 ]; then
        hour=12
    fi

    echo "Time: $hour:$minute"
}

#Call the function and store the result
time=$(convert_tim)

#stores curent directory in variable
crnt_dir=$(pwd)

#clears text from terminal
clear

#prints out time and current directory
echo "┌──($time)-[$crnt_dir]
└─ls"

#lists all files and dirs
ls
