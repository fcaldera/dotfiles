return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      opts = {
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore",
          },
        },
      },
    },
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "current",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["f"] = "none",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })

    vim.keymap.set("n", "<leader>ke", ":Neotree show reveal_force_cwd current<CR>", { desc = "Show file [E]xplorer" })
    vim.keymap.set("n", "<leader>kt", ":Neotree toggle focus reveal left<CR>", { desc = "Toggle file [T]ree" })
  end,
}
