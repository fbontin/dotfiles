return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype == 'vue' then
        -- Avoid formatting vue files twice (due to EslintFixAll autocmd)
        return { lsp_fallback = false }
      end
      return { lsp_fallback = true }
    end,
  },
}
