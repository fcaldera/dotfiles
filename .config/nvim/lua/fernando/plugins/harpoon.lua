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

    vim.keymap.set("n", "<leader>ja", function() harpoon:list():select(1) end, { desc = "[J]ump: Harpoon buffer (a)" })
    vim.keymap.set("n", "<leader>js", function() harpoon:list():select(2) end, { desc = "[J]ump: Harpoon buffer (s)" })
    vim.keymap.set("n", "<leader>jd", function() harpoon:list():select(3) end, { desc = "[J]ump: Harpoon buffer (d)" })
    vim.keymap.set("n", "<leader>jf", function() harpoon:list():select(4) end, { desc = "[J]ump: Harpoon buffer (f)" })
    vim.keymap.set("n", "<leader>jg", function() harpoon:list():select(5) end, { desc = "[J]ump: Harpoon buffer (g)" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon: [P]revious" })
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon: [N]ext" })
    -- stylua: ignore end
  end,
}
