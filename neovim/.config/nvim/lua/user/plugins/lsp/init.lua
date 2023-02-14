return {
  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/typescript.nvim", -- for ts commands
  },
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    require("user.plugins.lsp.config")
    local lsp_keymaps = require("user.plugins.lsp.keymaps")
    local lsp_highlight_document = require("user.plugins.lsp.highlight_document")

    local opts = {
      on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.server_capabilities.document_formatting = false
        end
        lsp_keymaps(bufnr)
        lsp_highlight_document(client)
      end,
      capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "bashls",
        "jsonls",
        "yamlls",
      },
    })
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup(opts)
      end,
      ["lua_ls"] = function()
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
        }, opts))
      end,
    })

    require("typescript").setup({ server = opts })
  end,
}
