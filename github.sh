#!/usr/bin/env bash

echo "Generating SSH keys for github.com..."
ssh-keygen -t ed25519 -C "fer.caldera@gmail.com"
eval $(ssh-agent -c)
echo "\
Host *.github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_ed25519
" >>~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy <~/.ssh/id_ed25519.pub && open https://github.com/settings/keys

gh auth login
