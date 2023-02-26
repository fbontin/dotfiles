return {
  "echasnovski/mini.nvim",
  event = "BufEnter",
  config = function()
    require("mini.statusline").setup()
  end,
}
