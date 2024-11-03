# Plugins
if test -f  ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
 source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

# General
abbr -a lh ls -A | egrep '^\.'

# Keyboard re-mappings
#abbr --add krem keyremap
#abbr --add koff keyremap off

# tmux
#abbr -a tm  'tmux'
#abbr -a ta  'tmux a -t'
#abbr -a tad 'tmux a -t default'
#abbr -a tac 'tmux a -t config'

# k8s 
#abbr -a k 'kubectl'
#abbr -a kgp 'kubectl get pods'

# Glia Specifics
#abbr -a ds 'devspace'

# pnpm
if test -e ~/Library/pnpm 
	set -gx PNPM_HOME "/Users/fernando/Library/pnpm"
	if not string match -q -- $PNPM_HOME $PATH
	  set -gx PATH "$PNPM_HOME" $PATH
	end
end
# pnpm end
