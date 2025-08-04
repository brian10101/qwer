#!/bin/bash

#Used to install qwer.sh and it usable from anywhere just by typing 'qwer'

#Check if qwer is already installed

check_qwer=$(qwer 2>&1)

if [ "$check_qwer" = "install.sh: line 7: qwer: command not found" ]; then
    echo "- Installing now"
else 
    echo "Error: qwer is already installed"
    exit 0
fi 

#Copyig qwer.sh as qwer to /usr/local/bin to make it executable 
cp qwer.sh /usr/local/bin/qwer 

chmod +x /usr/local/bin/qwer

echo "- qwer has now be installed, to use it just anywhere just type qwer"
