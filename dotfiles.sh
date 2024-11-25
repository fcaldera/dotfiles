#!/usr/bin/env bash

# dotfiles.sh
# symlink my dotfiles to appropriate places

DOTFILES=(
	# ".bin"
	# ".bashrc"
	# ".bash_profile"
	".gitconfig"
	# ".profile"
	".tmux.conf"
	# ".xinitrc"
	# ".config/cmus/cmus.theme"
	# ".config/compton.conf"
	# ".config/dunst"
	# ".config/feh"
	# ".config/mpv"
	".config/nvim"
	".config/fish/config.fish"
	".config/fish/functions/keyremap.fish"
	".rgignore"
	# ".local/share/fonts"
	".tool-versions"
	".wezterm.lua"
	".config/aerospace"
)

for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${PWD}/${dotfile}" "${HOME}/${dotfile}"
done
