local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    templ = { "templ" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofmt", "goimports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    cs = { "csharpier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
