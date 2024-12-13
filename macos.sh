#!/usr/bin/env bash

# Disable Displays have separate Spaces
# System Settings → Desktop & Dock → Displays have separate Spaces
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

# Enable Group windows by application:
# System Settings → Desktop & Dock → Group windows by application
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
