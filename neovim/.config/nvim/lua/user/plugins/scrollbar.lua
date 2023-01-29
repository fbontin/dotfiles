return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
