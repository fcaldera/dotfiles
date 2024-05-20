return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

    ---@diagnostic disable-next-line missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "diff" },
      highlight = { enable = true },
    })

    local syntax_on = {
      elixir = true,
    }

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        pcall(vim.treesitter.start)

        if syntax_on[ft] then
          vim.bo[bufnr].syntax = "on"
        end
      end,
    })
  end,
}
