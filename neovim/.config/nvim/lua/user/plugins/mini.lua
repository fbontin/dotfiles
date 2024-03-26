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
    require("mini.pairs").setup()
    require("mini.indentscope").setup()
    require("mini.animate").setup({ scroll = { enable = false } })

    -- Open file explorer on current file path
    vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0)) <cr>")
  end,
}
