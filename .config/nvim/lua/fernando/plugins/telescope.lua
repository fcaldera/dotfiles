return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {},
        wrap_results = true,
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      pickers = {
        buffers = {
          mappings = {
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    local custom = require("fernando.custom.telescope")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", custom.live_multigrep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    -- Shortcut for searching packages files
    vim.keymap.set("n", "<leader>sp", function()
      builtin.find_files({
        cwd = vim.fs.joinpath(tostring(vim.fn.stdpath("data")), "lazy"),
      })
    end, { desc = "[S]earch [P]ackages files" })

    local builtin_colors = {
      "blue",
      "darkblue",
      "delek",
      "desert",
      "elflord",
      "evening",
      "industry",
      "koehler",
      "lunaperche",
      "morning",
      "murphy",
      "pablo",
      "peachpuff",
      "quiet",
      "randomhue",
      "retrobox",
      "ron",
      "shine",
      "torte",
      "unokai",
      "vim",
      "wildcharm",
      "zaibatsu",
      "zellner",
    }

    -- Shortcut for searching color schemes
    vim.keymap.set("n", "<leader>sc", function()
      local target = vim.fn.getcompletion

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.fn.getcompletion = function()
        return vim.tbl_filter(function(color)
          return not vim.tbl_contains(builtin_colors, color)
        end, target("", "color"))
      end

      builtin.colorscheme(require("telescope.themes").get_dropdown({
        enable_preview = true,
      }))

      vim.fn.getcompletion = target
    end, { desc = "[S]witch [C]olor scheme" })
  end,
}
