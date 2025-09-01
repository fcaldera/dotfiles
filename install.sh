#!/usr/bin/env bash

# Install command-line and apps tools using Homebrew.
# https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh
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
brew install zoxide
brew install tree-sitter-cli
brew install yqrashawn/goku/goku

brew install julien-cpsn/atac/atac
brew install FelixKratz/formulae/borders

# NodeJS
brew install gpg gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs

# Elixir/Erlang
brew install erlang
brew install elixir

# Fonts
brew install font-input
brew install font-hasklig
brew install font-fira-code
brew install font-monaspace
brew install font-jetbrains-mono

# Apps
brew install --cask wezterm
brew install --cask spotify
brew install --cask raycast
brew install --cask nikitabobko/tap/aerospace
brew install --cask karabiner-elements
# brew install --cask google-chrome
