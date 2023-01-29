return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  dependencies = { "p00f/nvim-ts-rainbow" },
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "css",
        "gitignore",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "make",
        "markdown",
        "python",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "yaml",
      },
      sync_install = false,
      autopairs = { enable = true },
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },
      context_commentstring = { -- needed for nvim-ts-context-commentstring
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
