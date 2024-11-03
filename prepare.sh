#!/usr/bin/env bash

# install the tools required to run dotfiles

printf >&2 '%s\n' "Checking required tools..."

if ! command -v -- "brew" >/dev/null 2>&1; then
	printf >&2 '%s\n' "Homebrew not found. Installing..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo >>$HOME/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! command -v -- "fish" >/dev/null 2>&1; then
	brew install fish

	# Set as default shell
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)
fi

echo "Done!"
