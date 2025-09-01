#!/usr/bin/env bash

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing fish shell..."
brew install fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

exec fish

fish -c "
  set -Ux HOMEBREW_NO_ENV_HINTS 1
  fish_add_path /opt/homebrew/sbin
  fish_add_path /opt/homebrew/bin
"

# Fish package manager
brew install fisher

# Fish Prompt
fisher install pure-fish/pure

# Plugins
fisher install edc/bass
fisher install nickeb96/expanddots

# TMUX package manager
git clone https://github.com/tmux-plugins/tpm $TMP_DIR

echo "Done!"
