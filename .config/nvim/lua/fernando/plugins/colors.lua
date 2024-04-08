local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        treesitter_context = true,
        neotree = true,
        markdown = true,
        mason = true,
        which_key = true,
        mini = {
          enabled = true,
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        telescope = {
          enabled = true,
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            LineNr = { fg = colors.overlay1 },
            MiniStatuslineModeNormal = { bg = colors.text, style = {} },
            MiniStatuslineModeCommand = { style = {} },
            MiniStatuslineModeInsert = { style = {} },
            MiniStatuslineModeOther = { style = {} },
            MiniStatuslineModeReplace = { style = {} },
            MiniStatuslineModeVisual = { style = {} },
            MiniStatuslineFileinfo = { bg = colors.mantle },
          }
        end,
      },
    })

    vim.cmd.colorscheme("catppuccin")

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi("Comment gui=none")
  end,
}

local nightfly = {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme("nightfly")
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  lazy = false,
  config = function()
    require("kanagawa").setup({
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    })
    vim.cmd.colorscheme("kanagawa")
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

local nightowl = {
  "oxfist/night-owl.nvim",
  name = "night-owl",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("night-owl")
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

local dracula = {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("dracula")
  end,
}

return catppuccin
