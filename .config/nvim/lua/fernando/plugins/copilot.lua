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
    event = "VeryLazy",
    config = function()
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      chat.setup({
        answer_header = "  GitHub Copilot",
        question_header = " Fernando",
        error_header = "  Error",
        separator = " ",
        show_help = true,
        show_folds = false,
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
          BetterNamings = "Provide better names for the following variables and functions.",
          Summarize = "Summarize the following text.",
          Spelling = "Correct any grammar and spelling errors in the following text.",
          Wording = "Improve the grammar andvim.keymap. wording of the following text.",
          Concise = "Rewrite the following text to make it more concise.",
        },
        window = {
          width = 80,
        },
        selection = function(source)
          return select.visual(source) or select.buffer(source)
        end,
      })

      vim.keymap.set({ "n", "v" }, "<leader>co", "<cmd>CopilotChatOpen<CR>", { desc = "CopilotChat: [O]pen" })
      vim.keymap.set({ "n", "v" }, "<leader>cq", "<cmd>CopilotChatClose<CR>", { desc = "CopilotChat: [Q]uit" })
      vim.keymap.set({ "n", "v" }, "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "CopilotChat: [S]top" })

      vim.keymap.set({ "n", "v" }, "<leader>a", function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          chat.ask(input, {
            selection = function()
              return nil
            end,
          })
        end
      end, { desc = "[A]sk Copilot..." })

      vim.keymap.set({ "n", "v" }, "<leader>cp", function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end, { desc = "CopilotChat: [P]rompt" })
    end,
  },
}
