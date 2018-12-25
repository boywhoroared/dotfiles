#!/usr/bin/env bash


# See: 
# https://askubuntu.com/a/794087
# https://www.vinc17.net/unix/xkb.en.html

# Recompile existing keyboard mapping/configuration to include my local
# key/symbol map.


# `setxkbmap -print` get the current configuration 
# (/etc/default/keyboard) in a format that `xkbcomp` understands.
# See `man setxkbmap`.

# `sed` inserts the reference to our `local` map in the configuration 
#  * match the line starting with `xkb_symbol`
#  * substitute `" ` with `+local" ` (the `&` means insert the matching
#    text, in this case `" `). We're using `" ` to replace the end of
#    that line but before the `}'
# 
# `xkbcomp -Idir` compile the XKB keymap searching the default XKB
#  dirs and the path specified with `-I`. This way we are able to 
#  use the default maps/symbols and include our custom symbols
#  without directly modifying system files.
#  
#  Using `$DISPLAY` updates my current X display
#  (I suppose in future, if I have multiple displays, this won't be the
#  best option)
#  
# NOTE: In our symbols file, we define a the default, so we 
# do not need to explicitly indicate a variant.

setxkbmap -print | \
  sed -e '/xkb_symbols/s/"[[:space:]]/+local&/' | \
  xkbcomp -I${HOME}/.config/xkb - ${DISPLAY}

setxkbmap -option "ctrl:nocaps,shift:both_capslock"

# If we ever want to make this a system wide choice,
# see https://gist.github.com/nh2/ff15f412881f35ab7730

