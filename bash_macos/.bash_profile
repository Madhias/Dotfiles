HISTSIZE=

export COLOR_NC='\e[0m'
export COLOR_WHITE='\e[38;5;254m'
export COLOR_RED='\e[38;5;167m'
export COLOR_GREEN='\e[38;5;157m'
export COLOR_PURPLE='\e[38;5;133m'
export COLOR_YELLOW='\e[38;5;228m'
export COLOR_ORANGE='\e[38;5;221m'
export COLOR_BLUE='\e[38;5;075m'

PS1="\[${COLOR_WHITE}\](\[${COLOR_RED}\]\u\[${COLOR_WHITE}\])\[${COLOR_ORANGE}\]@\[${COLOR_WHITE}\](\[${COLOR_PURPLE}\]\h\[${COLOR_WHITE}\]) \[${COLOR_GREEN}\]\w\$: \[${COLOR_NC}\]"

alias ls='ls -lah --color=auto'

eval `dircolors ~/.bash.dircolors.tomorrow`
