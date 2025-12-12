#!/usr/bin/env bash
set -euo pipefail

sudo -v

if ! command -v brew >/dev/null 2>&1; then
	echo "Installing Homebrew..."
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	brew update
fi

if ! command -v git >/dev/null 2>&1; then
	brew install git
fi

if [ ! -d "$HOME/projects/dotfiles" ]; then
	mkdir -p $HOME/projects
	git clone https://github.com/fcaldera/dotfiles $HOME/projects/dotfiles
fi

cd $HOME/projects/dotfiles
sudo ./dotfiles.sh install
