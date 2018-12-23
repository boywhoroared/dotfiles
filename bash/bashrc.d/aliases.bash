# console
alias v="$VISUAL"

# Directories
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -"
alias mkdir="mkdir -p"

alias projects="cd $PROJECTS"

alias l='ls -f'
alias ll='ls -aAplhF'
alias lh='ls -Alh'
# only list directories
alias ld="ls -lF | grep '^d'"

alias filesize='du -sh'

# History
alias h="history"
# find a command in history
alias h?="history | grep"
# edit a command from history. I always forget fc
alias he="fc"

# git
alias g="git"
alias gap="git add -p"

alias tmux="tmux -2"
alias ssh='TERM=xterm ssh'
# fixes the issue (screen-256 unknown terminal type)
# with TMUX and the clear command over ssh

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
