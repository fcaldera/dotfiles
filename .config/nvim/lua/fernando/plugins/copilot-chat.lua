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
      clear_chat_on_new_prompt = false,
      mappings = { close = { insert = "" } },
      prompts = {
        BetterNamings = "/COPILOT_GENERATE Provide better names for the following variables and functions.",
        -- Text related prompts
        -- Summarize = "/COPILOT_GENERATE Summarize the following text.",
        -- Spelling = "/COPILOT_GENERATE Correct any grammar and spelling errors in the following text.",
        -- Wording = "/COPILOT_GENERATE Improve the grammar and wording of the following text.",
        -- Concise = "/COPILOT_GENERATE Rewrite the following text to make it more concise.",
      },
    })

    vim.keymap.set("n", "<leader>kc", "<cmd>CopilotChatToggle<CR>", { desc = "[C]hat window" })

    vim.keymap.set("n", "<leader>ka", function()
      local input = vim.fn.input("Ask Copilot: ")
      if input ~= "" then
        require("CopilotChat").ask(input)
      end
    end, { desc = "[A]sk Copilot..." })

    vim.keymap.set("n", "<leader>cp", function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
    end, { desc = "CopilotChat: [P]rompt actions" })
  end,
}
