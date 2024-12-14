local go_format_on_save = function(client, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function() end,
  })
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end

return {
  go_format_on_save = go_format_on_save,
}
