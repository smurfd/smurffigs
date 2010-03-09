###############################################################################
# local variables to use
ZH=~/.zsh

###############################################################################
# some environment variables to set up
export HOSTNAME="`hostname`"
export LESS="-MM"
export USERNAME="`whoami`"
###############################################################################
# paths are scanned from these files
export            PATH=`awk '{printf("%s:",$1);}' < $ZH/path | sed 's:~:'$HOME':g'`:$PATH
export LD_LIBRARY_PATH=`awk '{printf("%s:",$1);}' < $ZH/libs | sed 's:~:'$HOME':g'`

SYNC_PATH=`cat $ZH/sync_files | awk '{printf("%s ", $1);}' | sed 's:~:'$HOME':g'`
export SYNC_PATH

###############################################################################
# term type - if we dont know the term type - set it to linux
if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
  export TERM=linux
fi

###############################################################################
# my prompt
# normal prompt
# export PS1=$C1$G1$C2' %m '$C3$G2$C4$G1$C5' %t '$C0''$C6'%~'$C0' '
 
 black='%{[30m%}'
 red='%{[31m%}'
 green='%{[32m%}'
 yellow='%{[33m%}'
 blue='%{[34m%}'
 purple='%{[35m%}'
 cyan='%{[36m%}'
 grey='%{[37m%}'
 bg_black='%{[40m%}'
 bg_red='%{[41m%}'
 bg_green='%{[42m%}'
 bg_yellow='%{[43m%}'
 bg_blue='%{[44m%}'
 bg_purple='%{[45m%}'
 bg_cyan='%{[46m%}'
 bg_grey='%{[47m%}'
 bright='%{[01m%}'
 underline='%{[04m%}'
 flashing='%{[05m%}'
 normal='%{[0m%}'
 
if [ -n "$SSH_TTY" ]; then
# SSH session
  if [ "$USER" = "root" ]; then
  # root
    export PROMPT=$bright$bg_purple$red$USERNAME'@ '$HOSTNAME$red' %t '$red'%~'$normal$bg_purple$bright$red' #'$normal' '
  else
  # me
    export PROMPT=$bright$bg_blue$cyan$USERNAME' @ '$HOSTNAME$grey' %t '$cyan'%~'$normal$bg_blue$bright$grey' >'$normal' '
  fi
else
# local session
  if [ "$USER" = "root" ]; then
  # root
    export PROMPT=$bright$bg_red$yellow$USERNAME' {at} '$HOSTNAME' %t '$red'%~'$normal$bg_red$bright$yellow' #'$normal' '
  else
  # me
    export PROMPT=$bg_yellow$bright$bg_yellow$blue$USERNAME' {at} '$HOSTNAME$normal$black$bg_yellow$'\n%{\r%}'$bright$bg_grey$grey'%t '$black'%~'$normal$bg_grey$bright$grey' >'$normal' '
  fi
fi

# prompt you get when you dont finish typing stuff...
export PS2=$bright$bg_grey$black'? '$grey'>'$normal

###############################################################################
# function called before the prompt is displayed
function precmd {
# get a title at random from the title list
  if [ $TERM = xterm ]; then
    TLINES=`wc -l $ZH/titles | awk '{print $1;}'`
    TLINE=$[ ${RANDOM} % $TLINES ];
    TLINE=$[ $TLINE + 1 ];
    TITLE=`head -$TLINE < $ZH/titles | tail -1`
    echo -ne ']0;'$TITLE'\007'
  fi
}

###############################################################################
# misc settings
# num of times ctrl-d has to be pressed again to get zsh to exit
export IGNOREEOF=0
# set the default editor fc
export FCEDIT=jed
# define which file sets up the interactive input settings
export INPUTRC=$ZH/input
# set this variable to something so "dot" files in a pathname are expanded
export glob_dot_filenames=1
# make sure zsh doesn't follow links in expansions
export nolinks=1
# history
export HISTSIZE=1024
export HISTFILESIZE=1024
# hostname completion
export HOSTFILE="/etc/hosts"
# set the umask
umask 022
# setup the dir colours
eval `dircolors -b $ZH/ls_colors`
# get my aliases
. $ZH/aliases
# My preferred editor
export EDITOR=jed
# Jed settings
#if [ ! -f ~/.nojed ]; then
#  export JED_LIBRARY=~/.jed,/usr/lib/jed/lib
#  export JED_HOME=~/.jed
#fi
# just type directory name to cd to it
setopt AUTO_CD
# list all choices on an ambiguous completion
setopt AUTO_LIST
# after second completion attempt use a menu
setopt AUTO_MENU
# complete dirs with a / at the end
setopt AUTO_PARAM_SLASH
# dont run background jobs at a lower priority
setopt NO_BG_NICE
# if we cd to a dir that doesnt exist and its not starting with / try it in ~/
setopt CDABLE_VARS
# dont send HUP signales to jobs running if shell goes down
setopt NO_HUP
# notify me of bg jobs exiting immediately - not at next prompt
setopt NOTIFY
# extended globbing
setopt extendedglob

###############################################################################
# CVS stuff
export CVSROOT=enl@cvs.enlightenment.org:/cvs/e
export CVS_RSH=ssh

###############################################################################
# Compiler options
# my preferred compiler
export CC="`cat $ZH/cc`"
export CCACHE_NOSTATS=1
export CCACHE_HARDLINK=1
export MAKEFLAGS="-j 4"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

autoload -U compinit
compinit



# notes...
#################################
# tidbits of ansi escapes etc....
# scroll from 10 to 20
# $LINES = lines
# SCROLLREG='[10;20r'
#  LL=$[ $LINES - 2];
#  echo '['$LL';'1'H'
#  echo '[1;'$LL'r'

