local set = vim.opt_local

set.wrap = true -- Wrap text
set.breakindent = true -- Match indent on line break
set.linebreak = true -- Line break on whole words

-- Spell check
set.spell = true
set.spelllang = "en_us"

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
