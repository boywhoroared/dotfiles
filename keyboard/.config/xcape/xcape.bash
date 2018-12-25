#!/usr/bin/env bash


# Left Control generates Escape when pressed alone

xcape -e "Control_L=Escape"

# We have mapped Left Hyper to Tab and Right Hyper to Backslash in
# our custom keyboard layout, so, to regain those, we are using 
# `xcape` to produce their original codes when used alone
xcape -e "Hyper_L=Tab;Hyper_R=backslash"
