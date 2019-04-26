# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="cloud"

HIST_STAMPS="yyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github debian mercurial screen)

source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
# User configuration

export PATH=/usr/local/bin:/home/smurfd/Projects/Source/Mozilla/Arcanist/arcanist/bin/:/home/smurfd/Projects/Source/Mozilla/Arcanist/review/:/home/smurfd/Projects/Builds/Renpy:$PATH
export MOZCONFIG=~/.mozconfig

if [ -r /etc/debian_version ] ; then
# DEBIAN
alias ls='ls --color -p'
alias _update='sudo apt update &> /dev/null && sudo apt -uq upgrade'
alias _upgrade='sudo apt update &> /dev/null && sudo apt -uq dist-upgrade'
alias _search='apt search'
alias _install='sudo apt install'
alias _uninstall='sudo apt remove'
alias _info='uname -a && uptime'
alias _addkey='gpg --keyserver pgpkeys.mit.edu --recv-key $1 && gpg -a --export $1 | sudo apt-key add -'
alias _server="ssh -p 2222 smurfd@192.168.1.4"
alias _tv="ssh smurf@192.168.1.6"
alias _hold="sudo apt-mark hold "
elif [ -r /etc/SUSE-brand ] ; then
# openSUSE
alias ls='ls --color -p'
alias _update='sudo zypper up'
alias _upgrade='sudo zypper dup && sudo plymouth-set-default-theme -R breeze && sudo dracut -f && sudo mkinitrd'
alias _search='zypper se'
alias _install='sudo zypper in'
alias _uninstall='sudo zypper rm'
alias _server="ssh -p 2222 smurfd@192.168.0.10"
alias _info='uname -a && uptime'
alias _fixNvidia='sudo zypper in --force nvidia-glG05 nvidia-computeG05 nvidia-gfxG05-kmp-default x11-video-nvidiaG05'
alias python='/usr/bin/python3'
alias v='/home/smurfd/Projects/Builds/VIM/bin/vim'
alias gv='GTK_THEME=Adwaita /home/smurfd/Projects/Builds/VIM/bin/gvim'
alias s='/home/smurfd/Projects/Builds/SublimeText/sublime_text'
fi

