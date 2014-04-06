#!/bin/sh

# Disable the Ping sidebar
defaults write com.apple.iTunes disablePingSidebar -bool true

# Disable all the other Ping stuff
defaults write com.apple.iTunes disablePing -bool true

# Make ⌘F focus the search input
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"