return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })

    vim.keymap.set("n", "<leader>tc", function()
      vim.g.copilot_enabled = not vim.g.copilot_enabled
    end, { desc = "[T]oggle [c]opilot" })

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false
  end,
}
