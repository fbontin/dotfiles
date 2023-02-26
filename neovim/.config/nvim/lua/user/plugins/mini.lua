return {
  "echasnovski/mini.nvim",
  event = "BufEnter",
  config = function()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
  end,
}
