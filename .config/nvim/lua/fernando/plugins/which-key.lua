return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    delay = 0,
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>r", group = "[R]eplace" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>g", group = "[G]it" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>v", group = "[V]iew" },
      { "<leader>q", group = "[Q]uickfix" },
      { "<leader>k", group = "[K]ommands" },
      { "<leader>h", group = "[H]unk", mode = { "n", "v" } },
      { "<leader>a", group = "[A]lternatives" },
      { "<leader>j", group = "[J]umps" },
    },
  },
}
