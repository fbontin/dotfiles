return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    })

    vim.keymap.set(
      "n",
      "<leader>p",
      "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    )
    vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>")
  end,
}
