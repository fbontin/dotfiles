return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      rust = { "rust_analyzer" },
      elixir = { "elixirls" },
      lua = { "lua_ls" },
      -- no js/ts formatting, that's handled by eslint through lsp, see lsp-zero.lua
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = false }
  },
}
