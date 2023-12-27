return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = false,
  priority = 1000,
  dependencies = {
    "f-person/auto-dark-mode.nvim",
    "sainnhe/everforest",
  },
  config = function()
    local auto_dark_mode = require("auto-dark-mode")
    vim.g.moonflyTransparent = true
    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme moonfly")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme everforest")
      end,
    })
    auto_dark_mode.init()
  end,
}
