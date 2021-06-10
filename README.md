
# Shell

Ref: [profiles-and-rc-files](https://www.linuxjournal.com/content/profiles-and-rc-files)
## Login Shell process

-  /etc/profile
  - /etc/profile.d/   # Add any custom profile configs inside here as .sh file

- .bash_profile       # Searches in the following order and the when the first
  .bash_login         # is found, executes it and stops. So if `.bash_profile`
  .profile            # is present, `.profile` is not executed.

- .bashrc             # Make sure it is called from one of the above.

- /etc/bashrc         # Usually no change here 
  /etc/bash.bashrc  


## Interactive Shell Process

- /etc/bashrc         #  
  /etc/bash.bashrc  


- .bashrc            # Called directly without any profile being executed.

This shell doesn't look for any profile information at all, either system-wide 
or in the user directory. However, because an interactive shell is a "child" process
of the login shell used to log in initially (either via GUI or SSH), it inherits 
all the profile information that initial login shell acquired.


## Profiles
Profiles mainly are used to load environment variables. Since profiles are loaded by 
login shells, and login shells are the initial entry point into a system, that's the 
time when setting up the environment makes the most sense. One of the biggest 
environment variables is the PATH variable.

## RC files
Used to set personal preferences for the command line. If you want a custom prompt, 
or prefer a specific color scheme, the bashrc system is where that would be set.
Also aliases.
