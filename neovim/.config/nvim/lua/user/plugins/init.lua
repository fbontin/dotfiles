return {
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim", -- Easily comment stuff
  --[[ "kyazdani42/nvim-web-devicons", ]]
  "kyazdani42/nvim-tree.lua",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "tpope/vim-sleuth", -- fixes errors from .editorconfig, e.g. in Kompis
  "jose-elias-alvarez/typescript.nvim", -- for ts commands

  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "p00f/nvim-ts-rainbow",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Colorscheme
  "nyoom-engineering/oxocarbon.nvim",

  -- Scrollbar
  "petertriho/nvim-scrollbar",
}
