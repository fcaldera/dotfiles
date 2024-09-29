return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>ka", function() harpoon:list():add() end, { desc = "Harpoon: [A]dd" })
    vim.keymap.set("n", "<leader>ke", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc= "Harpoon: [E]xplore" })

    vim.keymap.set("n", "<leader>ks", function() harpoon:list():select(2) end, { desc = "Harpoon: (1)" })
    vim.keymap.set("n", "<leader>kd", function() harpoon:list():select(5) end, { desc = "Harpoon: (2)" })
    vim.keymap.set("n", "<leader>kf", function() harpoon:list():select(5) end, { desc = "Harpoon: (3)" })
    vim.keymap.set("n", "<leader>kg", function() harpoon:list():select(6) end, { desc = "Harpoon: (4)" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon: [P]revious" })
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon: [N]ext" })
    -- stylua: ignore end
  end,
}
