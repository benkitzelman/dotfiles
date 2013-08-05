export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH:/usr/local/share/npm/bin:~/bin:./node_modules/.bin"
export NODE_PATH=/usr/local/lib/node_modules

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

blue="\033[0;34m"
red="\033[0;31m"
black="\033[0;30m"
light_red="\033[1;31m"
green="\033[0;32m"
light_green="\033[1;32m"
white="\e[1;37m"
light_gray="\033[0;37m"
yellow='\[\e[0;33m\]'
purple='\e[0;35m'       
cyan='\e[0;36m'         

function set_prompt {

  case $TERM in
    xterm*)
    TITLEBAR='${white}\u@\h:\w'
    ;;
    *)
    TITLEBAR='\u@\h:\w'
    ;;
  esac

  PS1="\n\[$yellow\]\u@\h:\[$red\](ruby:\$(~/.rvm/bin/rvm-prompt), node:\$(node_version))\n\[$white\]\w\[$green\] \$(parse_git_branch)\[$white\] $"
  PS2='> '
  PS4='+ '
}

#
# Determine which branch of GIT
#
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function node_version {
  node -v
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Ensure tab completion for git branches
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

set_prompt

[[ -s /Users/benkitzelman/.nvm/nvm.sh ]] && . /Users/benkitzelman/.nvm/nvm.sh
