# Plugins
if type -q fzf
  fzf --fish | source
end

if test -f  ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

# General
abbr -a lh ls -A | egrep '^\.'

# Keyboard re-mappings
abbr --add krem keyremap
abbr --add koff keyremap off

# tmux
abbr -a tm  'tmux'
abbr -a ta  'tmux a -t'
abbr -a tad 'tmux a -t default'
abbr -a tac 'tmux a -t config'

# k8s 
abbr -a k 'kubectl'
abbr -a kgp 'kubectl get pods'

# Glia Specifics
abbr -a ds 'devspace'
