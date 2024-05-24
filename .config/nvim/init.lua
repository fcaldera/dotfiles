--- Set <space> as the leader key
--- NOTE: Must happen before plugins are required
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

--- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Add lazy to the `runtimepath`
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("fernando.options")
require("fernando.filetypes")

-- Setup lazy and load my plugins
require("lazy").setup({ { import = "fernando.plugins" } }, {
  change_detection = {
    notify = false,
  },
})

require("fernando.keymaps")
