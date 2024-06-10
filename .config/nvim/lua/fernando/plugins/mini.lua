return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()

    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = vim.g.have_nerd_font })

    statusline.section_location = function()
      return "%2l:%-2v"
    end

    local orig_sm = statusline.section_mode

    statusline.section_mode = function(args)
      local mode, mode_hl = orig_sm(args)
      return string.upper(mode), mode_hl
    end
  end,
}
