#!/bin/bash

#Used to install qwer.sh and make it usable from anywhere just by typing 'qwer'

#Checking who is running the script

who_run() {
    crnt_usr=$(whoami)

    if [ "$crnt_usr" = "root" ]; then
    return 0
    else
        echo "X You are NOT root!"
        echo "- Please run with root since some parts of this script interact with files in '/usr/local/bin/'."
        exit 1
    fi
}

who_run

#Check if qwer is already installed to and then if yes exits

if ! command -v qwer >/dev/null 2>&1; then
    echo "- Installing now"
else 
    echo "X qwer is already installed"
    exit 1
fi

#Check if qwer.sh exists in dir or else gives error

if [ -f "./qwer.sh" ]; then
    # Copying qwer.sh as qwer to /usr/local/bin to make it executable 
    cp qwer.sh /usr/local/bin/qwer 

    chmod +x /usr/local/bin/qwer

    echo "- qwer has now been installed!"
    echo "- It can now be used by anyone, anywhere, just by typing 'qwer'."
    echo "- For more info, run 'qwer --help'."
else
    echo "X Could not install since qwer.sh is not here."
    echo "If you renamed it to something else, change it back to 'qwer.sh' and try again."
    echo "Or, if you deleted it, please delete this whole directory and reclone the repo."
    exit 1
fi
