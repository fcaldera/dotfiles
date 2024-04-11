return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require("mini.statusline")
    -- set use_icons to true if you have a Nerd Font
    statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return "%2l:%-2v"
    end

    local orig_sm = statusline.section_mode

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_mode = function(args)
      local mode, mode_hl = orig_sm(args)
      return string.upper(mode), mode_hl
    end

    local minifiles = require("mini.files")

    minifiles.setup({
      options = {
        use_as_default_explorer = true,
      },
    })

    vim.keymap.set("n", "<leader>kn", minifiles.open, { desc = "[N]avigate files" })

    vim.keymap.set("n", "<leader>kc", function()
      minifiles.open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = "Nagivate [C]urrent file directory" })

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
