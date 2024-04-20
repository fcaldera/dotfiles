return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      keymaps = {
        ["<C-c>"] = false, -- actions.close
        ["<C-h>"] = false, -- actions.select_split
        ["<C-l>"] = false, -- actions.refresh
        ["gq"] = "actions.close",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-r>"] = "actions.refresh",
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>ko", "<cmd>Oil<CR>", { desc = "[O]il file explorer" })
  end,
}
