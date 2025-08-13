#!/bin/bash

VERSION="5"

#Below(line 6) install.sh will incert the path of qwer.conf so the configs can be used. Please dont add anything to line 6 to make sure that it is open for the incert.
source /place/holder/and/warning/qwer/couldnt/source/qwer.conf


# --help and --version options

case "$1" in
    --help) 
        echo "qwer - A terminal tool used to clear the terminal, return 'ls', current time, working directory path, machine name, and current user all at once in a user friendly view."
        echo ""
        echo "qwer comes with robust built-in install and uninstall scripts along with a configuration file."
        echo ""
        echo "Any changes made to the config file will be reflected in the qwer installed in /usr/local/bin. Meaning, you can make a change and immediately run qwer!"
        echo ""
        echo "All qwer scripts and configs are found in the 'qwer' directory."
        echo "" 
        echo "How to run: just enter 'qwer'"
        echo ""
        echo "Reference (qwer output structure):"
        echo "┌──(([machine_name]@[current user])([time AM/PM format]))-[[current dir path]]
└─ls
[Directories and files in current directory]"
        echo ""
        echo "Options:"
        echo "  --help - Show this message"
        echo "  --version - Show version number"
        echo ""
        echo "Using uninstall.sh, install.sh, or qwer.conf:"
        echo ""
        echo "Navigate to the 'qwer' directory"
        echo "IF the 'qwer' directory's location has not changed since the last time bash install.sh was ran AND qwer.conf was successfully sourced in qwer.sh"
        echo ""
        echo "Then this is the qwer directory:"

        if [ -n "$qwer_location" ]; then 
            echo "$qwer_location"
        else
            echo "Last location not saved. This is becuase qwer.sh could not source qwer.conf."
        fi

        echo ""
        echo "Using uninstall.sh, install.sh, or qwer.conf:"
        echo ""
        echo "If it ends in .sh, run: 'bash [file].sh'"
        echo "If it ends in .conf, run: nano [file].conf"
        echo ""
        echo "Created by: Brian Calle (https://github.com/brian10101/)"
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
    secs=$(echo "$full_time" | cut -d ':' -f 3)

    if [ "$hour" -gt 12 ]; then
        hour=$((hour - 12))
        pm_am="PM"
    elif [ "$hour" -eq 0 ]; then
        hour=12
        pm_am="PM"
    else
        pm_am="AM"
    fi

    #Checking if config_secs is 'yes' to decide if seconds should be included
    if [ "$conf_secs" = "y" ]; then
        echo "($hour:$minute:$secs $pm_am)"
    else
        echo "($hour:$minute $pm_am)"
    fi
}

#Finds name of machine and curent user
find_machn_user(){
    user=$(whoami)
    machine=$(hostname -s)
    echo "($user@$machine)"
}

#Checks if qwer can acess the qwer.conf file and if not warns

conf_works_check_msg() {
    if [ "$conf_works" = "YES!" ];then
        :
    else
        echo "X qwer CAN'T access qwer.conf"
    fi
}


#Functions if configs allow it

if [ "$conf_machn_user" = "y" ]; then
    machn_user=$(find_machn_user)
elif [ "$conf_machn_user" = "n" ]; then
    :
else
    machn_user=$(find_machn_user)   
fi

if [ "$conf_hour_min" = "y" ]; then
    time=$(convert_time)
elif [ "$conf_hour_min" = "n" ]; then
    :
else
    time=$(convert_time)
fi

#stores curent directory in variable
crnt_dir=$(pwd)

#Making it all work:

#clears text from terminal
clear

#prints out time and current directory
echo "┌──($machn_user$time)-[$crnt_dir]
└─ls"

#lists all files and dirs
ls

conf_works_check_msg