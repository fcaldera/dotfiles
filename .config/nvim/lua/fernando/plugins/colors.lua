return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "main", -- auto, main, moon, or dawn
      extend_background_behind_borders = true,
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
      highlight_groups = {
        -- CursorLine = { bg = "none" },
        CursorLineNr = { fg = "gold" },
        -- Identifier = { fg = "pine" },
        ["@module.elixir"] = { fg = "foam" },
        ["@string.special.symbol.elixir"] = { fg = "iris" },
        ["@constant.elixir"] = { fg = "text" },
        Comment = { italic = true },
        -- TabLine = { bg = "overlay" },
        -- TabLineFill = { bg = "overlay" },
        -- TabLineHead = { bg = "foam", fg = "highlight_med" },
        -- TabLineSel = { bg = "base", fg = "text" },
        -- TabLineSelMark = { fg = "muted" },
        NotificationInfo = { bg = "overlay", fg = "text" },
      },
    })

    vim.cmd.colorscheme("rose-pine")
  end,
}

-- vim: ts=2 sts=2 sw=2 et
