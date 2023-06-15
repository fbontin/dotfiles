return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  event = "VeryLazy",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    })
    telescope.load_extension("live_grep_args")

    vim.keymap.set("n", "<leader>p",
      "<cmd>lua require'telescope.builtin'.find_files({ hidden = true, previewer = false })<cr>")
    vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep_args<cr>")
    vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>")
    vim.keymap.set("n", "<leader>s", "<cmd>Telescope git_status<cr>")
    vim.keymap.set("n", "<leader>a", "<cmd>Telescope resume<cr>")
  end,
}
