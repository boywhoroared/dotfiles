#!/bin/bash

# Remove the dock configuration and forcibly kill the Dock
defaults delete com.apple.dock; killall Dock
