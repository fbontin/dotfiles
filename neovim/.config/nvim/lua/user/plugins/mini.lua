return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("mini.statusline").setup()
    require("mini.comment").setup({
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    })
    require("mini.bufremove").setup()
    require("mini.surround").setup()
    require("mini.files").setup()

    vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
  end,
}
