local set = vim.opt_local

set.wrap = true
set.textwidth = 80
set.colorcolumn = "81"

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
