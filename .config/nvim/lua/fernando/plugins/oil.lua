return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-c>"] = false, -- actions.close
        ["<C-h>"] = false, -- actions.select_split
        ["<C-l>"] = false, -- actions.refresh
        ["gq"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    })

    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
