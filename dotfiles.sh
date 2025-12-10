#!/usr/bin/env bash

dry_run=false

DOTFILES=(
	".gitconfig"
	".rgignore"
	".tool-versions"
	".tmux.conf"
	".wezterm.lua"
	".config/karabiner.edn"
	".config/nvim"
	".config/aerospace"
	".config/fish/config.fish"
	".config/fish/functions/fish_user_key_bindings.fish"
	".local/bin/tmux-chop"
	".local/bin/tmux-auto"
)

show_help() {
	cat <<EOF
Usage: $0 <subcommand> [args]

Subcommands:
  install    Install tools and apps
  apply      Symlink dotfiles
  help       Show this help

Global flags:
  -v         Verbose output
  -n         Dry run (show commands only)

EOF

	exit 0
}

cmd_apply() {
	for dotfile in "${DOTFILES[@]}"; do
		src="${PWD}/${dotfile}"
		target="${HOME}/${dotfile}"

		if $verbose; then echo "Linking $src -> $target"; fi

		if ! $dry_run; then
			mkdir -p "$(dirname "$target")"
			[[ -L $target ]] && rm -rf "$target"
			ln -sf "$src" "$target"
		fi
	done
	echo "Dotfiles applied."
}

cmd_install() {
	if ! command -v brew >/dev/null 2>&1; then
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo "Updating Homebrew..."
		brew update
	fi

	echo "Installing brew packages..."
	brew bundle install

	echo "Configuring fish shell..."
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)

	fish -c "
	set -Ux HOMEBREW_NO_ENV_HINTS 1
	fish_add_path /opt/homebrew/sbin
	fish_add_path /opt/homebrew/bin
	fisher install pure-fish/pure
	"

	if ! command -v uv >/dev/null 2>&1; then
		echo "Installing uv (python)"
		curl -LsSf https://astral.sh/uv/install.sh | sh
		uv generate-shell-completion fish >"$HOME/.config/fish/completions/uv.fish"
	fi

	echo "Installing uv packages..."
	uv tool install --python 3.13 posting # https://github.com/darrenburns/posting
	uv tool install harlequin             # https://github.com/tconbeer/harlequin

	echo "Installing asdf packages..."
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs

	if ! command -v bun >/dev/null 2>&1; then
		echo "Installing bun..."
		curl -fsSL https://bun.sh/install | bash
	fi

	echo "Installing js packages..."
	bun add taskbook # https://github.com/klaudiosinani/taskbook SSH

	# scripts
	./github.sh
	./docker-compose.sh
	./macos.sh

	echo "Done!"
}

# parse global options
while getopts ":nh" opt; do
	case $opt in
	h) show_help ;;
	n) dry_run=true ;;
	\?)
		echo "Invalid option: -$OPTARG"
		show_help
		exit 1
		;;
	esac
done
shift $((OPTIND - 1))

# Dispatch subcommand
case "${1:-help}" in
install)
	shift
	cmd_install "$@"
	;;
apply)
	shift
	cmd_apply "$@"
	;;
help | -h | --help)
	shift
	show_help
	;;
*)
	echo "Unknown subcommand: $1"
	show_help
	;;
esac
