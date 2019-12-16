# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash options
shopt -s autocd # Automatically `cd` by typing the directory name
shopt -s cdspell # Fix minor spelling mistakes on `cd`
shopt -s checkjobs # Check for running jobs before exiting an interactive shell
shopt -s extglob # Extended globbing, yay

bind 'set completion-ignore-case on' # Case-insensitive tab completion for directories and files

export HISTIGNORE="&:ls:[bf]g:exit"
export GPG_TTY=$(tty)


# Set prompt
function git_prompt() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) != "true" ]]; then
    return
  fi

  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}

  echo -n " ("

  if [[ $(git status 2>/dev/null | tail -n1) = *"nothing to commit"* ]]; then
    echo -n "\[\033[0;32m\]$branch_name\[\033[0m\]"
  elif [[ $(git status 2>/dev/null | head -n5) = *"Changes to be committed"* ]]; then
    echo -n "\[\033[1;36m\]$branch_name\[\033[0m\]"
  else
    echo -n "\[\033[1;33m\]$branch_name*\[\033[0m\]"
  fi

  echo -n ")"
}

function prompt() {
  PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]$(git_prompt)\n\\$ \[$(tput sgr0)\]"
}

PROMPT_COMMAND=prompt


# Aliases
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -hl'
alias la='ls -hal'

alias git='hub'


# Temporary solution until I properly map my printscreen button lmao
alias screenie='scrot -o /tmp/screenshot.png && xclip -selection clipboard -t image/png < /tmp/screenshot.png'


# lfcd
LFCD="/usr/share/lf/lfcd.sh"
[ -f "$LFCD" ] && source "$LFCD"
