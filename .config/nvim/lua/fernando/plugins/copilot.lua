return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    "github/copilot.vim", -- or "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim", -- for curl, log wrapper
  },
  config = function()
    require("CopilotChat").setup({
      debug = false, -- Enable debugging
      window = {
        width = 0.25,
      },
    })

    vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    vim.keymap.set("n", "<leader>tc", function()
      vim.g.copilot_enabled = not vim.g.copilot_enabled
      print("Copilot " .. (vim.g.copilot_enabled and "enabled" or "disabled"))
    end, { desc = "[T]oggle [c]opilot" })

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
  end,
}
