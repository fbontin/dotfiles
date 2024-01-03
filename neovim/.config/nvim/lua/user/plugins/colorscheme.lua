return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "f-person/auto-dark-mode.nvim",
    "sainnhe/everforest",
  },
  config = function()
    local auto_dark_mode = require("auto-dark-mode")
    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        require("tokyonight").setup({
          style = "moon",
          transparent = true,
          on_colors = function(colors)
            colors.comment = "#bbbbbb"
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#999999', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#999999', bold = true })
          end
        })
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme tokyonight")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme everforest")
      end,
    })
    auto_dark_mode.init()
  end,
}
