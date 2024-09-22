return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true

    ---@diagnostic disable-next-line missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "diff", "elixir" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Configure gotmpl parser
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
