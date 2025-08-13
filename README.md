<h1>qwer</h1>

<h2>About</h2>

<h3>What is it?</h3>

<p> qwer is a simple Linux terminal tool used to clear the terminal, return 'ls', current time, working directory path, machine name, and current user all at once in a user firendly view. It is meant to allow to allow users to navigate and clear their terminal more efficiently. Additionally, qwer comes with robust built-in install and uninstall scripts along with a configuration file. Any changes made to this config file are immediately reflected in the qwer command installed in /usr/local/bin and will be visible the next time you run qwer.</p>

<h3>Why I made it?</h3>

<p>While learning to navigate the terminal, I often found myself chaining the clear and ls commands. That’s when I decided to create a tool that combined the two! I named it qwer because those letters are right next to each other on the keyboard, and all the fingers are close by while typing. This allows the user to execute the tool quickly. Over time, I added features and improvements, leading to the current version of qwer.</p>

<h2>Installation</h2>

<p>Since some parts of the installation need root privileges, I will use sudo su to switch to root. However, you are free to use sudo instead for commands that require privileges, such as running install.sh or uninstall.sh.</p>

    git clone https://github.com/brian10101/qwer.git
    cd qwer
    sudo su

Then run

    bash install.sh

<h4>Output:</h4>

```
┌──(root@workstation1)-[/home/brian/qwer]
└─# bash install.sh

 *########*                      ,*.              ,*.  ,*.   
    '##'                       __|#|__            |#|  |#|   
     ##      *        ,####*. *#######*   __   *  |#|  |#|   
     ##      #.&#&,  &         '‾|#|‾'  #'  '#.#  |#|  |#|   
     ##      #    #   '*###,     |#|   #'    '|#  |#|  |#|   
    ,##,     #    #        &     |#|   &      |#  |#|  |#|   
 *########*  *    *  '*###*'     '*'   '&.__#/'*  '*'  '*'   
                                                             
                                                             
- Installing now
- qwer.conf was successfully sourced in qwer.sh
- Location of qwer dir has been saved to qwer.conf
- qwer has now been installed!
- It can now be used by anyone, anywhere, just by typing 'qwer'.
- For more info, run 'qwer --help'.
```

Now that you have completed the installation, qwer could be used by anyone (No sudo or root needed), anywhere, just by typing `qwer`!

<h2>Using qwer</h2>

```
qwer
```

<h4>Example output:</h4>

```
┌──((brian@workstation1)(7:26 PM))-[/home/brian/Documents/writing]
└─ls
ideas        old_writing      writing1.txt        writing2.txt
new_writing  short_story.txt  writing2_final.txt
```

<h3>--help:</h3>

    qwer --help

<h4>Output:</h4>

```
┌──((brian@workstation1)(7:26 PM))-[/home/brian/Documents/writing]
└─$ qwer --help
qwer - A terminal tool used to clear the terminal, return 'ls', current time, working directory path, machine name, and current user all at once in a user friendly view.

qwer comes with robust built-in install and uninstall scripts along with a configuration file.

Any changes made to the config file will be reflected in the qwer installed in /usr/local/bin. Meaning, you can make a change and immediately run qwer!

All qwer scripts and configs are found in the 'qwer' directory.

How to run: just enter 'qwer'

Reference (qwer output structure):
┌──(([machine_name]@[current user])([time AM/PM format]))-[[current dir path]]
└─ls
[Directories and files in current directory]

Options:
  --help - Show this message
  --version - Show version number

Using uninstall.sh, install.sh, or qwer.conf:

Navigate to the 'qwer' directory
IF the 'qwer' directory's location has not changed since the last time bash install.sh was ran AND qwer.conf was successfully sourced in qwer.sh

Then this is the qwer directory:
/home/brian/qwer

Using uninstall.sh, install.sh, or qwer.conf:

If it ends in .sh, run: 'bash [file].sh'
If it ends in .conf, run: nano [file].conf

Created by: Brian Calle (https://github.com/brian10101/)

```

<h2>Setting configurations</h2>
<p>Navigate to the 'qwer' directory. This is the directory that was created when you downloaded qwer. It is important because it contains all the control files for qwer, including install.sh, uninstall.sh, and qwer.conf</p>
<p>OR: run if you dont know where it is located, run qwer --help and you will see the last known path for the qwer directory</p>
<p>When you are in the 'qwer' directory run:</p>

    nano qwer.conf

<p>This allows you to open and use the Nano text editor. I recommend using Nano, as it's available in many Linux distributions, but you can use any text editor you prefer.</p>

<p>Use the arrow keys to move the cursor and edit the configuration file according to the instructions provided within it. These instructions will guide you on what can and cannot be customized.</p>

<p>When you're done editing, press <kbd>Ctrl</kbd> + <kbd>O</kbd> to save, then <kbd>Ctrl</kbd> + <kbd>X</kbd> to exit. The next time you run qwer, your new configurations will be applied.</p>


<h2>Uninstalling</h2>
<p>Navigate to the 'qwer' directory and run:</p>

    sudo bash uninstall.sh

<h4>Output:</h4>

```
┌──(brian@workstation1)-[~/qwer]
└─$ sudo bash uninstall.sh
[sudo] password for kali:
 
 ,*       *,         _                    ,*.             ,*. ,*. 
 |#       #|        |#|                 __|#|__           |#| |#| 
 |#       #| *       ‾  *       ,####*.*#######*  __   *  |#| |#| 
 |#       #| #.&#&, ,*. #.&#&, &        '‾|#|‾' #'  '#.#  |#| |#| 
 .#       #, #    # |#| #    #  '*###,    |#|  #'    '|#  |#| |#| 
  .#,   ,#,  #    # |#| #    #       &    |#|  &      |#  |#| |#| 
   '*###*'   *    * '*' *    * '*###*'    '*'  '&.__#/'*  '*' '*' 
                                                                           
                                                                           
What type of Uninstall do you want?

Options:
1. Partial: Removes qwer from '/usr/local/bin/'.
Use case: To replace the working version of qwer. Example: If you make changes to bash.sh and want to update your working qwer, run this before using install to set your new version.

2. Total: Removes qwer from '/usr/local/bin/' and removes qwer directory
Use case: To completely delete everything about qwer. Use before downloading new update from repo: https://github.com/brian10101/qwer or Uninstall Completely

3. Exit: Leave this script

Input option number (1, 2, or 3):

```

<p>Choose the option that best fits your use case.</p>
<p>Each option is very user-friendly, self-explanatory, and has tons of error handling, so I won't be walking you through each of them.</p>

<h3>Important, Keep in mind:</h3>

<p>After you run the 'Total' option in the uninstall.sh script you will get the follwing warning. However it is nothing to worry about. As long as you follow its instructions you will be ok!</p>

<h4>The Warning you will get:</h4>

```
Input option number (1, 2, or 3):

2

- Are you sure you want to delete ALL of qwer including the install and uninstall scripts? (enter 'y' or 'n')
y
- 'qwer' directory removed.
- qwer has been removed from '/usr/local/bin/'

- If you decide to use qwer again please go to https://github.com/brian10101/qwer

*.                  .*                                  
 \#,               /#'                         _                   
  \#,             /#'                         |#|                     
   \#,           /#'   __   *  * ,#*  *        ‾   *          __   *  
    \#,   /#    /#'  #'  '#.#  ##'    #.&#&,  ,*.  #.&#&,   #'  '#.#  
     \#, /# #  /#'  #'    '|#  #      #    #  |#|  #    #  #'     |#  
      \#/#   #/#'   &      |#  #      #    #  |#|  #    #  &      ##  
       '*     *'    '&.__#/'*  *      *    *  '*'  *    *  '&.__#/|#  
                                                                  .#  
                                                                  ,#  
                                                                 ,#'  
                                                           *\#&//*'  
WARNING: You are currently in a DELETED directory! 
Please RUN 'cd ..'

This happened becuase the uninstall.sh script deleted the 'qwer' directory(which was this one.)
No need to panic, just RUN 'cd ..' to return to a valid location

- Thank you for trying qwer!

                              
```
<p>To sum up what to do when you get this warning, just run 'cd ..'.</p>

<h3>NOTE:</h3>
<p>As you may have noticed, this project includes some ASCII art. If you decide to make some changes to changes to the qwer project using an IDE such as VS Code, some of the art, especially in qwer.conf, may appear distorted.</p>
<p>If this happens, don’t worry. The art is still intact and will display correctly when you run the file in a terminal or in nano.</p>
<p>Lastly, this is just a warning and is not meant to discourage you from making your own additions or changes to qwer.</p>

<h2>End</h2>

<p>That is all!</p>
<p>Thanks for checking out this repo.</P>


