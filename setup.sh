#!usr/bin/env bash
set -euo pipefail

bash ./dotfiles.sh
bash ./install.sh
bash ./github.sh
bash ./macos.sh
