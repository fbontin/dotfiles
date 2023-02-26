return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        indicator = {
          style = "underline",
        },
      },
    })
  end,
}
