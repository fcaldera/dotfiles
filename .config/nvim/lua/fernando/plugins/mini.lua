return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()

    require("mini.statusline").setup({
      use_icons = vim.g.have_nerd_font,
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
  end,
}
