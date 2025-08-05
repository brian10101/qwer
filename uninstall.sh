#!/bin/bash

#Used to remove qwer from '/usr/local/bin/' or to completely remove qwer and the qwer directory

#Making functions

#Checking who is running the script

who_run() {
    crnt_usr=$(whoami)

    if [ "$crnt_usr" = "root" ]; then
    return 0
    else
        echo "X You are NOT root!"
        echo "- Please run with root since some parts of this script interact with files in '/usr/local/bin/'"
        exit 0
    fi
}

#Func checks if qwer was removed from '/usr/local/bin/'

check_qwer_rm() {
    check_qwer=$(qwer 2>&1 | cut -d ':' -f2- | sed 's/^ *//')

    if [ "$check_qwer" = "qwer: command not found" ]; then
        echo "- qwer has been removed from '/usr/local/bin/'"
    else 
        echo "X qwer could not be removed from '/usr/local/bin/'"
    fi 
}

#Partial: Removes qwer from '/usr/local/bin/'

partial_un() {
    cd /usr/local/bin/
    rm qwer
}

#Total: Removes qwer from /usr/local/bin/ and removes qwer dir

total_un() {
    check_qwer_dir=$(check_qwer_rm)

    if [ "$check_qwer_dir" = "- qwer has been removed from '/usr/local/bin/'" ]; then
        echo "X Cannot run Total since total needs qwer to be present in 'usr/local/bin/'"
        echo "- Please run 'bash install.sh' to readd qwer to the path and THEN try to do Total Unintall again"
        echo "- Exiting scipt"
        exit 0
    else
        partial_un
        cd ..
        check_crnt_dir=$(pwd)
        echo "- Are you sure? And is the qwer directory here?(enter 'y' or 'n')"
        read -r rm_dir_choice

        if [ "$rm_dir_choice" = "y" ]; then
            if [ -d "qwer" ]; then
                rm -rf qwer
                echo "- 'qwer' directory removed."
            else
                echo "X 'qwer' directory not found in $check_crnt_dir"
                echo "- Exiting script"
                exit 1
            fi

        elif [ "$rm_dir_choice" = "n" ]; then
            echo "- Thanks for changing your mind!"
            echo "- Exiting script"
            exit 0
        else
            echo "X Bad input, only 'y' for yes or 'n' for no"
            echo "- Exiting script"
            exit 0
        fi
    fi
}

#Checks if user is root to continue
who_run

#Asking user what type of uninstall tthey want
echo "What type of Uninstall do you want?"
echo ""
echo "Options:"
echo "1. Partial: Removes qwer from '/usr/local/bin/'." 
echo "Use case: To replace the working version of qwer. Example: If you make changes to bash.sh and want to update your working qwer, run this before using install to set your new version."
echo ""
echo "2. Total: Removes qwer from '/usr/local/bin/' and removes qwer directory"
echo "Use case: To completely delete everything about qwer. Use before downloading new update from repo: https://github.com/brian10101/qwer or Uninstall Completely"
echo ""
echo "3. Exit: Leave this script"
echo ""
echo "Input option number (1, 2, or 3):"
echo ""
read -r u_choice

if ! (( u_choice )); then
    echo "X Input is NOT a valid option!"
    echo "- Exiting uninstaller."
    echo "- Please rerun to try again."
    exit 0
elif [ "$u_choice" -eq "1" ]; then
    partial_un
    check_qwer_rm
elif [ "$u_choice" -eq "2" ]; then
    total_un
    check_qwer_rm
    echo "- qwer directory has been removed"
    echo ""
    echo "- If you decide to use qwer again please go to https://github.com/brian10101/qwer"
    echo ""
    echo "- Thank you for trying qwer!"
elif [ "$u_choice" -eq "3" ]; then
    echo "- Exited uninstaller"
    exit 0
else
    echo "X Input is NOT a valid option!"
    echo "- Exiting unistaller."
    echo "- Please rerun to try again."
    exit 0
fi 
