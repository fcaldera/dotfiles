return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "elixir",
        "heex",
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    })

    -- Configure gotmpl parser
    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- parser_config.gotmpl = {
    --   install_info = {
    --     url = "https://github.com/ngalaiko/tree-sitter-go-template",
    --     files = { "src/parser.c" },
    --   },
    --   filetype = "gotmpl",
    --   used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
    -- }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
