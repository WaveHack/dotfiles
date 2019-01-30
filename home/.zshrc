# Load Antigen
source ~/.zsh/antigen/antigen.zsh

# Use oh-my-zsh as base
antigen use oh-my-zsh

# Oh-my-zsh plugins
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle git

# Custom plugins

# Load ZSH theme
antigen theme ys

# Tell Antigen that you're done.
antigen apply

# Load additional ZSH config files
source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh
