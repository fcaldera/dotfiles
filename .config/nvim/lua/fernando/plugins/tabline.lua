return {
  "nanozuki/tabby.nvim",
  -- event = 'VimEnter', -- if you want lazy load, see below
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local theme = {
      fill = "TabLineFill",
      head = "TabLine",
      current_tab = "TabLineSel",
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
    }
    require("tabby").setup({
      line = function(line)
        return {
          {
            { "  ", hl = theme.head },
            line.sep(" ", theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab

            return {
              string.format(" %s ", tab.name()),
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
