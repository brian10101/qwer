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
        exit 1
    fi
}

#Checks if qwer was removed from '/usr/local/bin/' by checking if an executable named qwer exists in $PATH

check_qwer_rm() {
    if ! command -v qwer >/dev/null 2>&1; then
        return 1
        #This means qwer is NOT installed

    else 
        return 0
        #This means qwer IS installed
    fi
}

#Uses check_qwer_rm and then returns a message for the user

check_qwer_rm_msg() {
    check_qwer_rm
    check_qwer=$?
    if [ "$check_qwer" = "1" ]; then
        echo "- qwer has been removed from '/usr/local/bin/'"
    elif [ "$check_qwer" = "0" ]; then
        echo "X qwer could not be removed from '/usr/local/bin/'"
    else
        echo "X Something went wrong qwer could not be removed"
        
    fi 
}

warning_art() {
    echo "*.                  .*                                  "
    echo " \#,               /#'                         _                   "
    echo "  \#,             /#'                         |#|                     "
    echo "   \#,           /#'   __   *  * ,#*  *        ‾   *          __   *  "
    echo "    \#,   /#    /#'  #'  '#.#  ##'    #.&#&,  ,*.  #.&#&,   #'  '#.#  "
    echo "     \#, /# #  /#'  #'    '|#  #      #    #  |#|  #    #  #'     |#  "
    echo "      \#/#   #/#'   &      |#  #      #    #  |#|  #    #  &      ##  "
    echo "       '*     *'    '&.__#/'*  *      *    *  '*'  *    *  '&.__#/|#  "
    echo "                                                                  .#  "
    echo "                                                                  ,#  "
    echo "                                                                 ,#'  "
    echo "                                                           *\#&//*'  "

}

#Partial: Removes qwer from '/usr/local/bin/'

partial_un() {
    cd /usr/local/bin/
    rm qwer

}

#Undoes partial_un and checks if it was successful

undo_partial_un(){
    bash install.sh

    check_qwer_rm
    check_qwer=$?

    if [ "$check_qwer" = "1" ]; then
        echo "X Something went wrong. qwer could not be reinstalled in '/usr/local/bin/'"
    elif [ "$check_qwer" = "0" ]; then
        echo "- qwer was successfully reinstalled in '/usr/local/bin/'. You may now continue"
    else
        echo "X Something went wrong qwer could not be reinstalled "
    fi
}

#Total: Removes qwer from /usr/local/bin/ and removes qwer dir

total_un() {
    #Checking if qwer is installed or not, since to do a Total uninstall, qwer needs to be in /usr/local/bin/ and checking current directory for future reference
    check_qwer_rm
    check_qwer=$?
    starting_dir=$(pwd)

#Based on the results of check_qwer_rm it either continues with the Total uninstall or exits and displays errors
    if [ "$check_qwer" = "1" ]; then
        echo "X Cannot run 'Total' since 'Total' needs qwer to be present in 'usr/local/bin/'"
        echo "Attempting to reinstall qwer in 'usr/local/bin/' for you:"
        undo_partial_un
        echo "- Please try to run 'Total Uninstall' again if automatic reinstall was successful"
        echo "- Exiting script"
        exit 1
    else
        partial_un
        cd $starting_dir
        cd ..
        check_crnt_dir=$(pwd)
        echo "- Are you sure you want to delete ALL of qwer including the install and uninstall scripts? (enter 'y' or 'n')"
        read -r rm_dir_choice

        #Checks if user chose yes or no in confirmation and then does respective action
        if [ "$rm_dir_choice" = "y" ]; then
            #Checks if the qwer directory is present
            if [ -d "qwer" ]; then
                rm -rf qwer
                echo "- 'qwer' directory removed."
            else
                echo "X 'qwer' directory not found in $check_crnt_dir"
                echo "- If you renamed it to something else, change it back."
                echo "- Exiting script"
                exit 1
            fi

        elif [ "$rm_dir_choice" = "n" ]; then
            echo "- Thanks for changing your mind!"
            echo "- Restoring qwer deletion from '/usr/local/bin/':"
            cd $starting_dir
            undo_partial_un            
            echo "- Exiting script"
            exit 0
        else
            echo "X Bad input, only 'y' for yes or 'n' for no"
            echo "- Restoring qwer deletion from '/usr/local/bin/':"
            cd $starting_dir
            undo_partial_un 
            echo "- Exiting script"
            exit 1
        fi
    fi
}

#Checks if user is root to continue
who_run

#Asking user what type of uninstall they want
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

#Processing User choice and calling on respective fucns
if ! (( u_choice )); then
    echo "X Input is NOT a valid option!"
    echo "- Exiting uninstaller."
    echo "- Please rerun to try again."
    exit 1
elif [ "$u_choice" -eq "1" ]; then
    partial_un
    check_qwer_rm_msg
    echo "- To reinstall in '/usr/local/bin/'"
    echo "- Run install.sh"
elif [ "$u_choice" -eq "2" ]; then
    total_un
    check_qwer_rm_msg
    echo ""
    echo "- If you decide to use qwer again please go to https://github.com/brian10101/qwer"
    echo ""
    warning_art
    echo "WARNING: You are currently in a DELETED directory! "
    echo "Please RUN 'cd ..'"
    echo ""
    echo "This happened becuase the uninstall.sh script deleted the 'qwer' directory(which was this one.)"
    echo "No need to panic, just RUN 'cd ..' to return to a valid location"
    echo ""
    echo "- Thank you for trying qwer!"
elif [ "$u_choice" -eq "3" ]; then
    echo "- Exited uninstaller"
    exit 0
else
    echo "X Input is NOT a valid option!"
    echo "- Exiting uninstaller."
    echo "- Please rerun to try again."
    exit 1
fi 
