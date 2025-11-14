# Abbreviations
abbr -a lh "ls -A | egrep '^\.'"
abbr -a kube 'kubectl'
abbr -a doco 'docker compose'
abbr -a chop 'tmux-chop'

# Environment
set -x ATAC_KEY_BINDINGS ~/.config/atac/key_bindings.toml

# pnpm
if test -e ~/Library/pnpm 
	set -gx PNPM_HOME "/Users/fernando/Library/pnpm"
	if not string match -q -- $PNPM_HOME $PATH
	  set -gx PATH "$PNPM_HOME" $PATH
	end
end
# pnpm end

# Plugins
if test -f  ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
 source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

fzf --fish | source
zoxide init fish --cmd cd | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
