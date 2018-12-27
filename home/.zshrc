#!/bin/bash

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Options
setopt appendhistory autocd nomatch
unsetopt beep

bindkey -e

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit promptinit

compinit
promptinit

# Set prompt
prompt walters

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases
