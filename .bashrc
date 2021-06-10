# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load any supplementary scripts
for config in "$HOME"/.bash.d/*.sh ; do
    source "$config"
done
unset -v config

# System PATH variable additions

# Go:lang
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go  

#kubebuilder-2.3.1
export PATH=$PATH:/usr/local/kubebuilder/bin 


