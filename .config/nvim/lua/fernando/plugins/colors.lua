return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    -- priority = 1000,
    -- lazy = false,
    config = function()
      require("kanagawa").setup({
        dimInactive = false,
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
            TabLine = { bg = theme.ui.bg_m3, fg = theme.ui.special },
            TabLineFill = { bg = theme.ui.bg_m3 },
            TabLineSel = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
          }
        end,
      })

      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    -- lazy = false,
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

      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    -- priority = 1000,
    -- lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
        highlight_groups = {
          CursorLineNr = { fg = "gold" },
          Identifier = { fg = "foam" },
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
