#!/usr/bin/env bash

## Screenshots folder
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

## Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults delete com.apple.dock persistent-apps

## Finder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder FinderSpawnTab -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Displays
defaults write com.apple.spaces spans-displays -bool true

# Keyboard

## Set a fast key repeat rate (the fastest setting is 1, a very fast setting is 2)
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# --- Text Input Settings ---

## Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## Disable automatic period substitution with a double space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

## Disable smart quotes as they are annoying for code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## Disable smart dashes as they are annoying for code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

## Hide the Input menu from the menu bar
defaults write com.apple.TextInputMenu visible -bool false

# Click wallpaper to reveal desktop → Only in Stage Manager
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
defaults write com.apple.WindowManager EnableStageManagerClickToShowDesktop -bool true

# Turn Stage Manager off
defaults write com.apple.WindowManager GloballyEnabled -bool false

# Appearance to Auto (Light/Dark mode)
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

# Restart to apply changes
killall SystemUIServer
killall Dock
killall Finder
killall ControlCenter

# Following changes only take effect after logging out or restarting the Mac

# Disable keyboard shortcuts related to Mission Control.
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 60 '<dict><key>enabled</key><false/></dict>'
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 '<dict><key>enabled</key><false/></dict>'
