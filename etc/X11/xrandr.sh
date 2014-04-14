#!/bin/bash

# XRANDR
# Configure screen outputs. Useful for multihead configs. 
# https://wiki.archlinux.org/index.php/Xrandr#Configuration

IN="LVDS1"
EXT="VGA1"

if (xrandr | grep "$EXT connected"); then
  ## external screen is to left of my laptop screen.
  xrandr --output $EXT --left-of $IN

  ## external screen is my primary monitor
  xrandr --output $EXT --primary
fi

