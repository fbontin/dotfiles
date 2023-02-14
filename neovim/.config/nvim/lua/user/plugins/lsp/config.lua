-- Turn off vim writing an error message when on the same line
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true },
})
