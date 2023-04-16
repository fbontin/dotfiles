return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "petertriho/nvim-scrollbar" },
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
    })
    require("scrollbar").setup({
      marks = {
        Error = { color = "#ff5454" },
        Warn = { color = "#e3c78a" },
      }
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
