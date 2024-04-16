return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-fugitive", -- Git related plugins
  "tpope/vim-rhubarb",
  "mbbill/undotree",
  { -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  "sindrets/diffview.nvim"
}
