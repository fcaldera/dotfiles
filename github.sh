#!/usr/bin/env bash
set -euo pipefail

SSH_DIR="$HOME/.ssh"
SSH_IDENTITY="$SSH_DIR/id_ed25519"
SSH_CONFIG="$SSH_DIR/config"
SSH_HOST_BLOCK="Host *.github.com"

# Make sure ~/.ssh exists with sane permissions
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [[ ! -f "$SSH_IDENTITY" ]]; then
	echo "Generating ssh key..."
	ssh-keygen -t ed25519 -N "" -f "$SSH_IDENTITY" \
		-C "$(git config --get user.email || echo fer.caldera@gmail.com)"
fi

# Start ssh-agent if needed
if [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
	eval "$(ssh-agent -c)"
fi

# Ensure key is added to agent
ssh-add "$SSH_IDENTITY"

# Ensure SSH config contains GitHub block
if [[ ! -f "$SSH_CONFIG" ]] || ! grep -q "^$SSH_HOST_BLOCK" "$SSH_CONFIG"; then
	cat <<-EOF >>"$SSH_CONFIG"

		$SSH_HOST_BLOCK
		  AddKeysToAgent yes
		  IdentityFile $SSH_IDENTITY
	EOF
fi

if [[ "${1:-}" == "-i" ]]; then
	if ! command -v gh >/dev/null 2>&1; then
		echo "gh CLI not found. Install it before using -i." >&2
		exit 1
	fi

	gh auth login
	gh ssh-key add "$SSH_IDENTITY.pub" --type signing || true
else
	cat <<-EOF
		SSH keys for GitHub are now available. 
		Add your key to github.com with:

		  gh auth login
		  gh ssh-key add "$SSH_IDENTITY.pub" --type signing

	EOF
fi
