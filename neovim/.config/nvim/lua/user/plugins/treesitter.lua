return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "nvim-treesitter/nvim-treesitter-context",
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
      rainbow = { enable = true },
      context_commentstring = {
        -- needed for nvim-ts-context-commentstring
        enable = true,
        enable_autocmd = false,
      },
    })
    require("treesitter-context").setup()
  end,
}
