#!/bin/sh

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Increase key repeat speed - faster than the preference pane's fastest
defaults write NSGlobalDomain KeyRepeat -int 0