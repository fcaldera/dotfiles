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
    require("mini.statusline").setup({
      -- set use_icons to true if you have a Nerd Font
      use_icons = vim.g.have_nerd_font,
      -- Customize to include copilot status
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git = MiniStatusline.section_git({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local filename = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = "%2l:%-2v" -- MiniStatusline.section_location({ trunc_width = 75 })
          local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
          local copilot = ""

          local ok, clients = pcall(vim.lsp.get_active_clients, { name = "GitHub Copilot", bufnr = 0 })
          if ok and #clients > 0 then
            copilot = vim.g.copilot_enabled and " " or " "
          end

          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { string.upper(mode) } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics, copilot } },
            "%<", -- Mark general truncate point
            { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=", -- End left alignment
            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          })
        end,
      },
    })

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
