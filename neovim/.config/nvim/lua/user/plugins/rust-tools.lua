return {
  "simrat39/rust-tools.nvim",
  event = { "BufReadPre *.rs", "BufNewFile *.rs" },
  dependencies = "neovim/nvim-lspconfig",
  opts = function()
    local server = require("user.plugins.lsp.server")

    return {
      server = {
        on_attach = server.on_attach,
        capabilities = server.capabilities,
      }
    }
  end
}
