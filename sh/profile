#!/bin/sh

# Add ~/.local/bin to PATH if it exists
if [ -d "$HOME"/.local/bin ] ; then
    PATH=$HOME/.local/bin:$PATH
fi

# Load all supplementary scripts in ~/.profile.d
if [ -d "$HOME"/.profile.d ] ; then
    for profile in "$HOME"/.profile.d/*.sh ; do
        if [ -e "$profile" ] ; then
            . "$profile"
        fi
    done
    unset -v profile
fi
