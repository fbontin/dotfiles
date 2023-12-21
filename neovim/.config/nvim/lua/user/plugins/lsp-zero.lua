return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    local lsp_zero = require('lsp-zero')
    lsp_zero.on_attach(function(_client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- FORMAT ON SAVE --
    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 5000,
      },
      servers = {
        ['rust_analyzer'] = { 'rust' },
        ['elixirls'] = { 'elixir' },
        ['lua_ls'] = { 'lua' },
      }
    })

    -- LUA --
    local lua_opts = lsp_zero.nvim_lua_ls()
    require('lspconfig').lua_ls.setup(lua_opts)

    -- MASON --
    -- see :help lsp-zero-guide:integrate-with-mason-nvim
    -- to learn how to use mason.nvim with lsp-zero
    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end
}
