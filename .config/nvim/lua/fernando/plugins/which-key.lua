return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>r", group = "[R]eplace" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>g", group = "[G]it" },
      { "<leader>b", group = "[B]uffers" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>v", group = "[V]iew" },
      { "<leader>q", group = "[Q]uickfix" },
      { "<leader>k", group = "Commands" },
    },
  },
}
