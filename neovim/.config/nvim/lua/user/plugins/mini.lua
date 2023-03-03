return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  config = function()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
    require("mini.comment").setup({
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    })
    require("mini.bufremove").setup()
    require("mini.tabline").setup()
    require("mini.bracketed").setup()

    -- for bracketed, to use ö and ä instead of brackets
    vim.api.nvim_set_keymap("n", "ö", "[", { silent = true })
    vim.api.nvim_set_keymap("n", "ä", "]", { silent = true })
  end,
}
