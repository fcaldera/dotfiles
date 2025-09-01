#!/usr/bin/env bash

echo "Symlink dotfiles..."

DOTFILES=(
	".gitconfig"
	".rgignore"
	".tool-versions"
	".tmux.conf"
	".wezterm.lua"
	".config/karabiner.edn"
	".config/nvim"
	".config/atac"
	".config/aerospace"
	".config/joshuto"
	".config/fish/config.fish"
	".config/fish/functions/keyremap.fish"
)

for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${PWD}/${dotfile}" "${HOME}/${dotfile}"
done
