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
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      },
    })
  end,
}
