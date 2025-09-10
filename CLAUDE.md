# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal macOS dotfiles repository for setting up a development machine. The repository contains configuration files and installation scripts for various development tools, window managers, and applications.

## Setup Commands

The repository follows a specific installation order:

```sh
sudo bash prepare.sh   # Install homebrew, fish shell, and basic setup
sudo bash setup.sh     # Run all installation scripts in sequence
```

The `setup.sh` script orchestrates the following operations:
- `dotfiles.sh` - Symlinks configuration files to home directory
- `install.sh` - Installs command-line tools and applications via homebrew
- `github.sh` - Sets up SSH keys and GitHub authentication
- `macos.sh` - Configures macOS system preferences

## Key Architecture

### Configuration Management
- Configuration files are stored in their expected directory structure within the repo
- `dotfiles.sh` creates symlinks from the repository to `$HOME` locations
- Managed configurations include: nvim, fish, tmux, karabiner, aerospace, and others

### Tool Installation
- Uses homebrew as the primary package manager
- Installs development tools (neovim, tmux, fzf, ripgrep, etc.)
- Sets up language runtimes via asdf (Node.js) and direct installation (Elixir/Erlang)
- Includes Docker setup with colima as the runtime

### Neovim Configuration
- Located in `.config/nvim/` with Lua-based configuration
- Uses lazy.nvim as plugin manager
- Modular structure with plugins organized by functionality
- Custom queries for treesitter parsers (Elixir, HEEx, TypeScript)

### macOS Integration
- Extensive system preference configuration via `defaults` commands
- Disables various hotkeys to avoid conflicts with custom keybindings
- Configures Dock, Finder, keyboard settings, and window management

## Environment Details

- Primary shell: fish with pure prompt
- Terminal: WezTerm
- Window manager: AeroSpace (tiling WM for macOS)
- Keyboard remapping: Karabiner Elements with custom EDN configuration
- Version management: asdf with Node.js 22.19.0
- Font preferences: Monaspace (v1.101 for proper Nerd Font icons)