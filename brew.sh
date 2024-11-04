#!/usr/bin/env bash

# Install command-line and apps tools using Homebrew.
# https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh
set -Ux HOMEBREW_NO_ENV_HINTS 1

# Configure fish shell
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin

# Package manager
brew install fisher

# Prompt
fisher install pure-fish/pure

# Plugins
fisher install jethrokuan/z
fisher install edc/bass
fisher install nickeb96/expanddots

brew install elixir
# brew install erlang
# brew install exercism
brew install fzf
brew install gh
brew install jq
brew install neovim
brew install ripgrep
brew install stylua
brew install tmux
brew install trash
brew install tree
brew install entr
brew install asdf

# Elixir/Erlang Dependencies
brew install autoconf openssl wxwidgets

# Fonts
brew install font-input
brew install font-monaspace
brew install font-hasklug-nerd-font
brew install font-jetbrains-mono-nerd-font

# Apps
brew install iterm2
brew install spotify
brew install google-chrome
# brew install firefox
# brew install visual-studio-code
# brew install zoom

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
