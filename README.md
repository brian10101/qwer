<h1>qwer</h1>

<h2>About</h2>

<h3>What is it?</h3>

<p> qwer is a simple Linux terminal tool used to clear the terminal, return 'ls', current time, and working directory all at once in a user friendly view. It is meant to allow to allow users to navigate and clear their terminal more efficiently</p>

<h3>Why I made it?</h3>

<p> I made it for myself since while I was learning to navigate the terminal I often found myself chaining the clear and ls commands. Over time I added and improved upon the concept and I have landed on this current version of qwer.</p>

<h2>Installation</h2>

<p>Since some of the parts of the installation need root privileges I will be doing sudo su to turn into root. But you are free to use sudo instead for parts that need privileges such as when running install.sh or uninstall.sh</p>

    git clone https://github.com/brian10101/qwer.git
    cd qwer
    sudo su

Then run

    bash install.sh

Now that you have completed the installation, qwer could be used by anyone (No sudo or root needed), anywhere, just by typing `qwer`!

<h2>Using qwer</h2>

```
qwer
```

<h4>Example output:</h4>

```
┌──(Time: 8:53)-[/home/kali/Documents/writing]
└─ls
ideas        old_writing      writing1.txt        writing2.txt
new_writing  short_story.txt  writing2_final.txt
```

<h3>--help:</h3>

    qwer --help

<h4>Output:</h4>

```
┌──(kali㉿kali)-[~/Documents/writing]
└─$ qwer --help
qwer - A terminal tool used to clear the terminal, return 'ls', current time, and working directory all at once in a user friendly view
Usage: qwer

Options:
  --help - Show this message
  --version - Show version number
Uninstall:
Navigate to qwer directory
Run 'bash uninstall.sh'
```

<h2>Uninstalling</h2>

<p>Navigate to your qwer directory. This is the directory that was created when you downloaded qwer. Do not delete the qwer directory as it houses all the control files (install.sh and uninstall.sh) for qwer</p>

    sudo su
    bash uninstall.sh

<h4>Output:</h4>

```
┌──(root㉿kali)-[/home/kali/qwer]
└─# bash uninstall.sh 
What type of Uninstall do you want?

Options:
1. Partial: Removes qwer from '/usr/local/bin/'.
Use case: To replace the working version of qwer. Example: If you make changes to bash.sh and want to update your working qwer, run this before using install to set your new version.

2. Total: Removes qwer from '/usr/local/bin/' and removes qwer directory
Use case: To completely delete everything about qwer. Use before downloading new update from repo: https://github.com/brian10101/qwer or Uninstall Completely

3. Exit: Leave this script

Input option number (1, 2, or 3):

```

<p>Based on your use case choose your option.</p>
<p>Each option is very user friendly, explains everything, and has tons of error handling, so I won't be walking you through each of them.</p>

<h3>Important, Keep in mind:</h3>

<p>After you run the 'Total' option in the uninstall.sh script you will get the follwing warning. However it is nothing to worry about. As long as you follow its instructions you will be ok!</p>

<h4>Warning you will get:</h4>

```
┌──(root㉿kali)-[/home/kali/qwer]
└─# bash uninstall.sh
What type of Uninstall do you want?

Options:
1. Partial: Removes qwer from '/usr/local/bin/'.
Use case: To replace the working version of qwer. Example: If you make changes to bash.sh and want to update your working qwer, run this before using install to set your new version.

2. Total: Removes qwer from '/usr/local/bin/' and removes qwer directory
Use case: To completely delete everything about qwer. Use before downloading new update from repo: https://github.com/brian10101/qwer or Uninstall Completely

3. Exit: Leave this script

Input option number (1, 2, or 3):

2
- Are you sure you want to delete ALL of qwer including the install and uninstall scripts? (enter 'y' or 'n')
y
- 'qwer' directory removed.
- qwer has been removed from '/usr/local/bin/'

- If you decide to use qwer again please go to https://github.com/brian10101/qwer

*                   *                                  
 #                 #                                            
  #               #                                             
   #             #  ____  *  # #*  *       #  *         ____  *        
    #     #     #  #    # #  ##    #&##&   *  #&##&    #    # #   
     #   # #   #  #       #  #     #    #  #  #    #  #       #   
      # #   # #   &      ##  #     #    #  #  #    #  &      ##  
       *     *      &__#/ *  *     *    *  *  *    *    &__#/ #  
                                                              #  
                                                              #  
                                                            ,#'  
                                                      *\#&/*'  
WARNING: You are currently in a DELETED directory! 
Please RUN 'cd ..'

This happened becuase the uninstall.sh script deleted the 'qwer' directory(which was this one.)
No need to panic, just RUN 'cd ..' to return to a valid location

- Thank you for trying qwer!
```
<p>To sum up what to do when you get this warning, just run 'cd ..'.</p>

<h2>End</h2>

<p>That is all!</p>
<p>Thanks for checking out this repo.</P>


