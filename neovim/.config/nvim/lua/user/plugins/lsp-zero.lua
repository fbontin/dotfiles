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
  config = function(_, opts)
    local lsp_zero = require('lsp-zero')
    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions

      if client.name == 'eslint' then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end

      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- CMP --
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }),
    })

    local lspconfig = require('lspconfig');
    -- LUA --
    local lua_opts = lsp_zero.nvim_lua_ls()
    lspconfig.lua_ls.setup(lua_opts)

    -- VUE --
    lspconfig.volar.setup {
      filetypes = { 'typescript', 'javascript', 'vue' },
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    }


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
