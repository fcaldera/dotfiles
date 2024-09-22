return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>ka", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>ke", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>ks", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>kd", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>kf", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>kg", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
    -- stylua: ignore end
  end,
}
