return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    -- stylua: ignore
    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns

      map({ "n", "v" }, "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Jump to next hunk" })

      map({ "n", "v" }, "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Jump to previous hunk" })

      map("n", "<leader>gh", gs.preview_hunk, { desc = "Preview [H]unk" })
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "[B]lame line" })
    end,
  },
}
