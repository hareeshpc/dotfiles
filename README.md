
# Shell

Ref: 
- [profiles-and-rc-files](https://www.linuxjournal.com/content/profiles-and-rc-files)
- https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
## Login Shell process

```
-  /etc/profile
  - /etc/profile.d/   # Add any custom profile configs inside here as .sh file

- .bash_profile       # Searches in the following order and the when the first
  .bash_login         # is found, executes it and stops. So if `.bash_profile`
  .profile            # is present, `.profile` is not executed.

- .bashrc             # Make sure it is called from one of the above.

- /etc/bashrc         # Usually no change here 
  [or] /etc/bash.bashrc  
```

## Interactive Shell Process

```
- /etc/bashrc         #  
  [or] /etc/bash.bashrc  


- .bashrc            # Called directly without any profile being executed.
```
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

## Recommendations

- `~/.bash_profile` should be super-simple and just load `.profile` and `.bashrc` (in that order)
- `~/.profile` has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)
- `~/.bashrc` has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use
- Anything that should be available to graphical applications OR to sh (or bash invoked as  sh) MUST be in `~/.profile`
- `~/.bashrc` must not output anything
- Anything that should be available only to login shells should go in `~/.profile`
- Ensure that `~/.bash_login` does not exist.

----  

For an “interactive non-login shell”, it reads .bashrc, but for an “interactive login shell” it reads from the first of .bash_profile, .bash_login and .profile (only). There is no sane reason why this should be so; it’s just historical. Follows in more detail.

```
+----------------+-----------+-----------+------+
|                |Interactive|Interactive|Script|
|                |login      |non-login  |      |
+----------------+-----------+-----------+------+
|/etc/profile    |   A       |           |      |
+----------------+-----------+-----------+------+
|/etc/bash.bashrc|           |    A      |      |
+----------------+-----------+-----------+------+
|~/.bashrc       |           |    B      |      |
+----------------+-----------+-----------+------+
|~/.bash_profile |   B1      |           |      |
+----------------+-----------+-----------+------+
|~/.bash_login   |   B2      |           |      |
+----------------+-----------+-----------+------+
|~/.profile      |   B3      |           |      |
+----------------+-----------+-----------+------+
|BASH_ENV        |           |           |  A   |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|                |           |           |      |
+----------------+-----------+-----------+------+
|~/.bash_logout  |    C      |           |      |
+----------------+-----------+-----------+------+
```
Reference: 
