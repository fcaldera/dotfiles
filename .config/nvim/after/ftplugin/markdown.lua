local set = vim.opt_local

set.wrap = true -- Wrap text
set.breakindent = true -- Match indent on line break
set.linebreak = true -- Line break on whole words

-- Spell check
set.spelllang = "en_us"
set.spell = true

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
