return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    "github/copilot.vim", -- or "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim", -- for curl, log wrapper
  },
  config = function()
    require("CopilotChat").setup({
      answer_header = "  GitHub Copilot",
      question_header = " Fernando",
      error_header = "  Error",
      separator = ":",
      show_help = false,
      auto_insert_mode = false,
      context = "buffer",
    })

    vim.keymap.set("n", "<leader>kc", "<cmd>CopilotChatToggle<CR>", { desc = "[C]hat" })

    vim.keymap.set("n", "<leader>ka", function()
      local input = vim.fn.input("Question: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end, { desc = "[A]sk Copilot..." })
  end,
}
