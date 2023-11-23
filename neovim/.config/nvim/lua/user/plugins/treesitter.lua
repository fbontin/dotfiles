return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {},
      auto_install = true,
      autopairs = { enable = true },
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      rainbow = { enable = true }
    })
    require("ts_context_commentstring").setup({})
    vim.g.skip_ts_context_commentstring_module = true;

    require("treesitter-context").setup()
  end,
}
