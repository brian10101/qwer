#!/bin/bash

#Used to install qwer.sh in #/usr/local/bin/ and allow all users to execute it.


#Install ascii art

install_art() {
    echo " *########*                      ,*.              ,*.  ,*.   "
    echo "    '##'                       __|#|__            |#|  |#|   "
    echo "     ##      *        ,####*. *#######*   __   *  |#|  |#|   "
    echo "     ##      #.&#&,  &         '‾|#|‾'  #'  '#.#  |#|  |#|   "
    echo "     ##      #    #   '*###,     |#|   #'    '|#  |#|  |#|   "
    echo "    ,##,     #    #        &     |#|   &      |#  |#|  |#|   "
    echo " *########*  *    *  '*###*'     '*'   '&.__#/'*  '*'  '*'   "
    echo "                                                             "
    echo "                                                             "
}

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

#Checks current directory and creates the path to where qwer.conf should be located if all went well. 
#This is done so qwer in '/usr/local/bin' can source qwer.conf no matter where the 'qwer' dir is located.

find_path_qwer_conf() {
    crnt_dir=$(pwd)
    echo "$crnt_dir/qwer.conf"
}

#Checks if qwer.conf was successfully sourced in qwer.sh

check_qwer_conf_success() {
    path_qwer_conf=$(find_path_qwer_conf)
    if grep -q "source $path_qwer_conf" qwer.sh; then
        echo "- qwer.conf was successfully sourced in qwer.sh"
    else
        echo "X qwer.conf was not added to qwer.sh"
        echo "- This means that any configurations you make in qwer.conf will not affect qwer"
        echo "- Why it may have happened:"
        echo "- You may have changed some code or renamed a file"
        echo ""
    fi
}

#Checks if qwer is installed and if its not it will installs qwer.sh in #/usr/local/bin/ and allow all users to execute it 

install(){

    #Check if qwer is already installed to and then if yes exits

    if ! command -v qwer >/dev/null 2>&1; then
        echo "- Installing now"
    else 
        echo "X qwer is already installed"
        exit 1
    fi

    #Check if qwer.sh exists in dir or else gives error

    if [ -f "./qwer.sh" ]; then
        #Making it so qwer.conf could be sourced in qwer.sh
        path_qwer_conf=$(find_path_qwer_conf)

        sed -i "6s|.*|source $path_qwer_conf|" qwer.sh

        # Copying qwer.sh as qwer to /usr/local/bin to make it executable 
        cp qwer.sh /usr/local/bin/qwer 

        chmod +x /usr/local/bin/qwer
        check_qwer_conf_success
        echo "- qwer has now been installed!"
        echo "- It can now be used by anyone, anywhere, just by typing 'qwer'."
        echo "- For more info, run 'qwer --help'."
    else
        echo "X Could not install since qwer.sh is not here."
        echo "If you renamed it to something else, change it back to 'qwer.sh' and try again."
        echo "Or, if you deleted it, please delete this whole directory and reclone the repo."
        exit 1
    fi
}

# This ensures that if this script is sourced (by another script such as uninstall.sh) the functions are only loaded by not ran. 

#Only if '${BASH_SOURCE[0]}'(the name of this script file) is the same as '${0}' (the bash comand that ran the script), then the functions will run, else nothing will run.

if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
    who_run
    chck_crnt_dir
    install_art
    install  
fi