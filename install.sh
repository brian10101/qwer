#!/bin/bash

#Used to install qwer.sh and it usable from anywhere just by typing 'qwer'

#Checking who is running the script

who_run() {
    crnt_usr=$(whoami)

    if [ "$crnt_usr" = "root" ]; then
    return 0
    else
        echo "X You are NOT root!"
        echo "- Please run with root since some parts of this script interact with files in '/usr/local/bin/'."
        exit 0
    fi
}

who_run

#Check if qwer is already installed

check_qwer=$(qwer 2>&1 | cut -d ':' -f2- | sed 's/^ *//')

if [ "$check_qwer" = "qwer: command not found" ]; then
    echo "- Installing now"
else 
    echo "X qwer is already installed"
    exit 0
fi 

#Copyig qwer.sh as qwer to /usr/local/bin to make it executable 
cp qwer.sh /usr/local/bin/qwer 

chmod +x /usr/local/bin/qwer

echo "- qwer has now been installed!"
echo "- It can now be used by anyone, anywhere, just by typing 'qwer'."
