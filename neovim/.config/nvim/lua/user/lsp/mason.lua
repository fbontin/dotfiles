local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
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

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

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
