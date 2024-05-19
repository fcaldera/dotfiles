return {
  {
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
            MiniStatuslineModeNormal = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
            MiniStatuslineModeCommand = { bg = theme.syn.operator, fg = theme.ui.bg },
            MiniStatuslineModeInsert = { bg = theme.diag.ok, fg = theme.ui.bg },
            MiniStatuslineModeReplace = { bg = theme.syn.constant, fg = theme.ui.bg },
            MiniStatuslineModeVisual = { bg = theme.syn.keyword, fg = theme.ui.bg },
          }
        end,
      })

      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "light",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        integrations = {
          mini = { enabled = true },
        },
        highlight_overrides = {
          all = function(colors)
            return {
              LineNr = { fg = colors.overlay1 },
              MiniStatuslineFileinfo = { bg = colors.mantle },
            }
          end,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
