return {
  "nanozuki/tabby.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local theme = {
      fill = "TabLineFill",
      head = "TabLineHead",
      current_tab = "TabLineSel",
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
    }
    require("tabby").setup({
      line = function(line)
        return {
          {
            { "  ", hl = theme.head },
            line.sep("", theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("  ", hl, hl),
              tab.is_current() and ":: " or "",
              tab.name(),
              tab.is_current() and " ::" or "",
              line.sep("  ", hl, hl),
              hl = hl,
            }
          end),
          line.spacer(),
          hl = theme.fill,
        }
      end,
    })
  end,
}
