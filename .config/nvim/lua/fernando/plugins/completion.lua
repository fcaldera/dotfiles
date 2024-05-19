return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  priority = 100,
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noinsert" }
    vim.opt.shortmess:append("c")

    local cmp = require("cmp")

    local luasnip = require("luasnip")
    luasnip.config.setup({
      update_events = { "TextChanged", "TextChangedI" },
    })

    local lspkind = require("lspkind")
    lspkind.init({})

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Accept ([y]es) the completion.
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),

        -- Abort completion
        ["<C-e>"] = cmp.mapping.abort(),

        -- Manually trigger a completion from nvim-cmp.
        ["<C-Space>"] = cmp.mapping.complete({}),
      },

      -- Enable luasnip to handle snippet expansion for nvim-cmp
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      ---@diagnostic disable-next-line missing-fields
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        }),
      },
    })

    -- Setup up vim-dadbod
    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })

    -- Load my custom snippets
    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/fernando/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end

    -- <c-l> will move you to the right of each of the expansion locations.
    vim.keymap.set({ "i", "s" }, "<c-l>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    -- <c-h> is similar, except moving you backwards.
    vim.keymap.set({ "i", "s" }, "<c-h>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end,
}
