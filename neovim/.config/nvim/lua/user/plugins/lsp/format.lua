local M = {}

M.autoformat = true

function M.format()
  local buf = vim.api.nvim_get_current_buf()
  if vim.b.autoformat == false then
    return
  end
  if M.autoformat == false then
    return
  end
  vim.lsp.buf.format(vim.tbl_deep_extend("force", { bufnr = buf }, {}))
end

function M.on_attach(client, buf)
  -- dont format if client disabled it
  if
      client.config
      and client.config.capabilities
      and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  if client.name == 'eslint' then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buf,
      command = "EslintFixAll",
    })
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
      buffer = buf,
      callback = M.format
    })
  end
end

return M
