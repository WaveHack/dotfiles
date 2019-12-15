#!/usr/bin/env sh

# xinitrc runs automaically when you run startx

# Xresources
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Startup apps
[ -f ~/.xprofile ] && . ~/.xprofile

# Run i3-gaps window manager
exec i3

