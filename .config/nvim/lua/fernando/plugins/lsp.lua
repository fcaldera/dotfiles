return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "j-hui/fidget.nvim", opts = {} },

    -- Autoformatting
    "stevearc/conform.nvim",

    -- Schema information
    "b0o/SchemaStore.nvim",
  },
  config = function()
    require("neodev").setup()

    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    local lspconfig = require("lspconfig")

    local servers = {
      lua_ls = true,
      cssls = true,
      html = true,
      -- bashls = true,
      -- gopls = false,
      -- rust_analyzer = false,
      -- svelte = false,
      -- templ = false,

      -- Probably want to disable formatting for this lang server
      tsserver = true,

      volar = {
        filetypes = { "vue", "javascript", "typescript" },
      },

      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },

      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },

      elixirls = {
        cmd = { "/Users/fernando/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
        root_dir = require("lspconfig.util").root_pattern({ "mix.exs" }),
      },

      -- lexical = {
      --   cmd = { "/Users/fernando/.local/share/nvim/mason/packages/lexical/lexical", "server" },
      --   root_dir = require("lspconfig.util").root_pattern({ "mix.exs" }),
      -- },
    }

    local servers_to_install = vim.tbl_filter(function(key)
      local t = servers[key]
      if type(t) == "table" then
        return not t.manual_install
      else
        return t
      end
    end, vim.tbl_keys(servers))

    require("mason").setup()

    local ensure_installed = {
      "stylua",
      "prettierd",
      "eslint_d",
    }

    vim.list_extend(ensure_installed, servers_to_install)
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, config in pairs(servers) do
      if config == true then
        ---@diagnostic disable-next-line cast-local-type
        config = {}
      end
      ---@diagnostic disable-next-line cast-local-type
      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities,
      }, config)

      lspconfig[name].setup(config)
    end

    local disable_semantic_tokens = {
      lua = true,
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "LSP: [G]oto [D]efinition" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "LSP: [G]oto [R]eferences" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "LSP: [G]oto [D]eclaration" })
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "LSP: [T]ype Definition" })

        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "LSP: [C]ode [R]ename" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "LSP: [C]ode [A]action" })

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        vim.keymap.set(
          "n",
          "<leader>ds",
          require("telescope.builtin").lsp_document_symbols,
          { buffer = bufnr, desc = "[D]ocument [S]ymbols" }
        )

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        vim.keymap.set(
          "n",
          "<leader>ws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          { buffer = bufnr, desc = "[W]orkspace [S]ymbols" }
        )

        local filetype = vim.bo[bufnr].filetype
        if disable_semantic_tokens[filetype] then
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = args.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = args.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Autoformatting Setup
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        vue = { "prettierd" },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          lsp_fallback = true,
          quiet = true,
        })
      end,
    })
  end,
}
