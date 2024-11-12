return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      [".env.local"] = {
        icon = "",
        color = "#faf743",
        cterm_color = "227",
        name = "Env",
      },
    },
  },
}
