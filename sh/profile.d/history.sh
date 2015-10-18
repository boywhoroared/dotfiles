# Keep History in .histfile to share between shells.
# By default, bash uses bash_history
HISTFILE="$HOME/.histfile"

# Keep around sixteen million lines of history in file
HISTFILESIZE=$((1 << 24))
SAVEHIST=$HISTFILESIZE

# Keep around four thousand lines of history in memory
HISTSIZE=$((1 << 12))

# Ignore duplicate commands and whitespace in history
HISTCONTROL=ignoreboth

# Keep the times of the commands in history
HISTTIMEFORMAT='%F %T  '
