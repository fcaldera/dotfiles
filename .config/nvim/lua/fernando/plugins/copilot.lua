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
        width = 0.5,
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

    vim.keymap.set("n", "<leader>cct", "<cmd>CopilotChatOpen<CR>", { desc = "CopilotChat - [O]pen" })

    vim.keymap.set("n", "<leader>ccq", function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end, { desc = "CopilotChat - Quick chat" })

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
  end,
}
