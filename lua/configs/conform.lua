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
    timeout_ms = 2000,
    lsp_fallback = true,
  },
  formatters = {
    csharpier = {
      args = function()
        local config_path = vim.fn.stdpath("config") .. "/.csharpierrc.json"
        return { "--config-path", config_path }
      end,
    },
  },
}

return options
