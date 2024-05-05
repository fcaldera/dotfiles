return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
    vim.g.copilot_hide_during_completion = true

    vim.keymap.set("n", "<leader>tc", function()
      vim.g.copilot_enabled = not vim.g.copilot_enabled
    end, { desc = "[T]oggle [c]opilot" })

    vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    local opts = { silent = true }

    vim.keymap.set("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)

    -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
    vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", opts)
    vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", opts)

    -- Set <C-d> to dismiss suggestion
    vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)

  end,
}
