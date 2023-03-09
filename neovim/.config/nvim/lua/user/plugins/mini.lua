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
    require("mini.bracketed").setup()
    require("mini.surround").setup()

    -- for bracketed, to use ö and ä instead of brackets
    vim.keymap.set("n", "ö", "[", { remap = true })
    vim.keymap.set("n", "ä", "]", { remap = true })
  end,
}
