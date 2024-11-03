#!/usr/bin/env bash

# install.sh
# symlink my dotfiles to appropriate places

DIR=$HOME/projects/dotfiles

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
	# ".config/fish/functions/keyremap.fish"
	".rgignore"
	# ".local/share/fonts"
	".tool-versions"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
