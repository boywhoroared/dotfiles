# Load ~/.profile regardless of shell version
if [ -e "$HOME"/.profile ] ; then
    . "$HOME"/.profile
fi

# Ensure we're using at least version 2.05. Weird arithmetic syntax needed here
# due to leading zeroes and trailing letters in some 2.x version numbers (e.g.
# 2.05a).
if ! [ -n "$BASH_VERSINFO" ] ; then
    return
elif ((BASH_VERSINFO[0] == 2)) && \
     ((10#${BASH_VERSINFO[1]%%[![:digit:]]*} < 5)) ; then
    return
fi

# Load any supplementary scripts
if [[ -d $HOME/.bash_profile.d ]] ; then
    for bash_profile in "$HOME"/.bash_profile.d/*.bash ; do
        if [[ -e $bash_profile ]] ; then
            source "$bash_profile"
        fi
    done
    unset -v bash_profile
fi

# Source interactive Bash config if it exists
if [[ -e $HOME/.bashrc ]] ; then
    source "$HOME"/.bashrc
fi

# The accepted practice is to source .bashrc in .bash_profile.
# You should not source .bash_profile from .bashrc
# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files
