local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "light",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}

local rosepine = {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "main", -- auto, main, moon, or dawn
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  lazy = false,
  config = function()
    require("kanagawa").setup({
      dimInactive = true,
      background = {
        dark = "dragon",
        light = "lotus",
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}

return kanagawa
-- vim: ts=2 sts=2 sw=2 et
