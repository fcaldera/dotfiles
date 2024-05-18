-- [[ Setting options ]]
-- See `:help vim.opt`
-- More info: `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- [[ Additional Settings ]]
-- Options below were added by me and not present in kickstart.nvim

-- Set completeopt to have a better completion experience
-- vim.opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
-- vim.opt.termguicolors = true

-- tabs & indentation
-- vim.opt.tabstop = 2 -- spaces for tabs
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2 -- spaces for indent width
-- vim.opt.expandtab = true -- expand tab to spaces
-- vim.opt.autoindent = true -- copy indent from current line when starting new one
-- vim.opt.smartindent = true
-- vim.opt.colorcolumn = "80"
-- vim.opt.wrap = false

-- Always use block cursor
-- vim.opt.guicursor = ""

-- Spell checker
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Don't have `o` add a comment
vim.opt.formatoptions:remove("o")

-- vim: ts=2 sts=2 sw=2 et
