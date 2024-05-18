return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup()

    require("which-key").register({
      ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
      ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "[R]eplace", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
      ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
      ["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
      ["<leader>v"] = { name = "[V]iew", _ = "which_key_ignore" },
      ["<leader>k"] = { name = "Commands", _ = "which_key_ignore" },
    })
  end,
}
