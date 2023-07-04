local lsp_keymaps = require("user.plugins.lsp.keymaps")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Returns language server "connections"
return {
  on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.document_formatting = false
    end
    require("user.plugins.lsp.format").on_attach(client, bufnr)
    lsp_keymaps(bufnr)
  end,
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
