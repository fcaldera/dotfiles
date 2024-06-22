#!/usr/bin/env bash

# Install and configure shell and prompt 

# Fish
brew install fish  

# Set as default shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
fish
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin

# Package manager
brew install fisher

# Prompt
fisher install rafaelrinaldi/pure

# Plugins
fisher install jethrokuan/z
fisher install edc/bass
fisher install jorgebucaran/fish-nvm
fisher install nickeb96/expanddots
