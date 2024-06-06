local opt = vim.opt

-- Make line numbers default
opt.number = true
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
opt.clipboard = "unnamedplus"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 0

-- [[ Additional Settings ]]
-- Options below were added by me and not present in kickstart.nvim

-- Appearance
opt.termguicolors = true
opt.background = "dark"
vim.diagnostic.config({
  float = { border = "rounded" }, -- add border to diagnostic popups
})

-- Tabs & Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.colorcolumn = "80"
opt.wrap = false

-- Always use block cursor
-- opt.guicursor = ""

-- Spell check
opt.spell = true
opt.spelllang = "en_us"

-- Don't have `o` add a comment
opt.formatoptions:remove("o")

-- vim: ts=2 sts=2 sw=2 et
