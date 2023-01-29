require("mason").setup({
  ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
})

local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "bashls",
  "jsonls",
  "yamlls",
}

local mason_lspconfig = require("mason-lspconfig")

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local lspconfig = require("lspconfig")

mason_lspconfig.setup({ ensure_installed = servers })
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(opts)
  end,
  ["sumneko_lua"] = function()
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    lspconfig.sumneko_lua.setup(sumneko_opts)
  end,
})

require("user.lsp.settings.typescript").setup(opts.on_attach, opts.capabilities)
