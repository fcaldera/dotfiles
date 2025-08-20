# Dotfiles

Configuration and tools for my macOS dev machine.

Run in following order:

```sh
sudo bash prepare.sh
# restart the session with `exec fish` then run
bash brew.sh
bash asdf.sh
bash doftiles.sh
```

## Notes

Monaspace 1.2+ include Nerd Fonts which makes the icons look too small on the terminal. To fix that, clone the repo, checkout v1.101, and drag the `fonts/otf` directory into Font Book.
