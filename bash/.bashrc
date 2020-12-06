#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export COLOR_NC='\e[0m'
export COLOR_WHITE='\e[38;5;254m'
export COLOR_RED='\e[38;5;167m'
export COLOR_GREEN='\e[38;5;157m'
export COLOR_PURPLE='\e[38;5;133m'
export COLOR_YELLOW='\e[38;5;228m'
export COLOR_ORANGE='\e[38;5;221m'
export COLOR_BLUE='\e[38;5;075m'

export VISUAL=vim
export EDITOR="$VISUAL"

PS1="[ \u ] @ [ \h ] \w \$:"

#alias ls='ls -lah'
#alias suvim='sudo -E vim'

source ~/dotfiles/grc/grc.bashrc

#eval `dircolors ~/.bash.dircolors.tomorrow`
alias fotos='cd /mnt/btrfspool/Fotos/'
