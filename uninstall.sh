#!/bin/bash

#Used to remove qwer from /usr/local/bin/qwer or to completely remove qwer and the qwer directory

#Making functions

#Partial: Removes qwer from /usr/local/bin/

partial_un() {
    cd /usr/local/bin/
    rm qwer
}

#Total: Removes qwer from /usr/local/bin/ and removes qwer dir

total_un() {
    partial_und
    crnt_dir=$(pwd)
    cd ..
    rm -rf qwer
}

#Func checks if qwer was removed from /usr/local/bin/

check_qwer_rm() {
    check_qwer=$(qwer 2>&1)

    if [ "$check_qwer" = "uninstall.sh: line 26: qwer: command not found" ]; then
        echo "- qwer has been removed from /usr/local/bin/"
    else 
        echo "Error: qwer could not be removed from" /usr/local/bin/
    fi 
}

#Asking user what type of uninstall tthey want
echo "What type of Uninstall do you want?"
echo "Options:"
echo "1. Partial: Removes qwer from /usr/local/bin/" 
echo "When: To make your own changes to bash.sh and use install.sh to add your new changes."
echo ""
echo "2. Total: Remove qwer from /usr/local/bin/ and removes qwer dir"
echo "When: To download new up date from repo: https://github.com/brian10101/qwer or Uninstall"
echo ""
echo "3. Exit: Leave this script"
echo ""
echo "Input 1, 2, or 3"
read u_choice

if [ "$u_choice" -eq "1" ]; then
    partial_un
    check_qwer_rm
elif [ "$u_choice" -eq "2" ]; then
    total_un
    check_qwer_rm
    echo "- qwer directory has been removed"
    echo ""
    echo "If you decide to use qwer again please go to https://github.com/brian10101/qwer"
    echo ""
    echo "Thank you for trying qwer!"
fi 