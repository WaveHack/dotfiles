# ZSH HISTORY SETTINGS

# Increase history size
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# Ignore consecutive duplicate history entries, and entries starting with a
# space
HISTCONTROL=ignoreboth

# Ignore certain commands from being saved to history
HISTORY_IGNORE="(exit)"

# Write to history file immediately upon command execution
setopt inc_append_history
