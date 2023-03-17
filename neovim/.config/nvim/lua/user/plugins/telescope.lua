return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  event = "VeryLazy",
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    })
    telescope.load_extension("live_grep_args")

    vim.keymap.set(
      "n",
      "<leader>p",
      "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    )
    vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep_args<cr>")
  end,
}
