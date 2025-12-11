#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "Updating Homebrew..."
	brew update
fi

if ! command -v git >/dev/null 2>&1; then
	brew install git
fi

mkdir -p $HOME/projects
git clone https://github.com/fcaldera/dotfiles $HOME/projects/dotfiles

cd $HOME/projects/dotfiles
./dotfiles.sh install
