return {
  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local server = require("user.plugins.lsp.server")

    mason.setup({ ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } })


    local options = {
      on_attach = server.on_attach,
      capabilities = server.capabilities,
    }

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "volar", -- ("vue-language-server")
        "bashls",
        "jsonls",
        "yamlls",
        "eslint",
      },
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup(options)
      end,
      ["lua_ls"] = function()
        require("user.plugins.lsp.format").autoformat = true
        lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        }, options))
      end,
      ['volar'] = function()
        require("user.plugins.lsp.format").autoformat = false
        lspconfig.volar.setup(options)
      end,
      ['jsonls'] = function()
        lspconfig.jsonls.setup(vim.tbl_deep_extend("force", {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
              select = {
                '.eslintrc',
                'package.json',
                'tsconfig.json',
              },
            },
          },
        }, options))
      end,
    })
  end,
}
