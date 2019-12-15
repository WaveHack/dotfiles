# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set prompt
PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 9)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 2)\]\h \[$(tput setaf 13)\]\W\[$(tput setaf 4)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Bash options
shopt -s autocd # Automatically `cd` by typing the directory name
shopt -s cdspell # Fix minor spelling mistakes on `cd`
shopt -s checkjobs # Check for running jobs before exiting an interactive shell
shopt -s extglob # Extended globbing, yay

bind 'set completion-ignore-case on' # Case-insensitive tab completion for directories and files

export HISTIGNORE="&:ls:[bf]g:exit"
export GPG_TTY=$(tty)

# Aliases
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -hl'
alias la='ls -hal'

alias git='hub'

# Temporary solution until I properly map my printscreen button
alias screenie='scrot -o /tmp/screenshot.png && xclip -selection clipboard -t image/png < /tmp/screenshot.png'

# lfcd
LFCD="/usr/share/lf/lfcd.sh"
[ -f "$LFCD" ] && source "$LFCD"

