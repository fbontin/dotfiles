return {
  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/typescript.nvim", -- for ts commands
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    require("user.plugins.lsp.config")
    local lsp_keymaps = require("user.plugins.lsp.keymaps")

    mason.setup({ ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } })


    local options = {
      on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.server_capabilities.document_formatting = false
        end
        require("user.plugins.lsp.format").on_attach(client, bufnr)
        lsp_keymaps(bufnr)
      end,
      capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
      end
    })

    require("typescript").setup({ server = options })
  end,
}
