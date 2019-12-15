#!/usr/bin/env sh

# Profile file. Runs on login. Environmental variables are set here.

#export PATH="$PATH:$HOME/.scripts"
export INFOPATH="$HOME/.local/share/info:"

export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

