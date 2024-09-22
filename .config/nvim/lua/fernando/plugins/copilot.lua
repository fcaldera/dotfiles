return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = false
      vim.g.copilot_hide_during_completion = true

      vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })

      -- Alternative to match standard completions accept
      vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })

      local opts = { silent = true }

      vim.keymap.set("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)

      -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
      vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", opts)
      vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", opts)

      -- Set <C-d> to dismiss suggestion
      vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", opts)
    end,
  },
  {
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
        separator = " ",
        show_help = true,
        auto_insert_mode = false,
        clear_chat_on_new_prompt = false,
        mappings = {
          close = {
            normal = "gq",
            insert = "",
          },
          reset = {
            normal = "gr",
            insert = "",
          },
        },
        prompts = {
          BetterNamings = "/COPILOT_GENERATE Provide better names for the following variables and functions.",
          -- Text related prompts
          Summarize = "/COPILOT_GENERATE Summarize the following text.",
          Spelling = "/COPILOT_GENERATE Correct any grammar and spelling errors in the following text.",
          Wording = "/COPILOT_GENERATE Improve the grammar and wording of the following text.",
          Concise = "/COPILOT_GENERATE Rewrite the following text to make it more concise.",
        },
        window = {
          width = 80,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChatOpen<CR>", { desc = "Copilot: [C]hat window" })

      vim.keymap.set({ "n", "v" }, "<leader>cA", function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end, { desc = "Copilot: [A]sk..." })

      vim.keymap.set({ "n", "v" }, "<leader>cp", function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end, { desc = "Copilot: [P]rompt actions" })
    end,
  },
}
