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
    c = { "clang_format" },
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
    prettier = {
      env = {
        LANG = "C",
        LC_ALL = "C",
      },
    },
    clang_format = {
      prepend_args = {
        "--style={IndentWidth: 2, IndentCaseLabels: true, UseTab: Never, IncludeBlocks: Preserve, SortIncludes: true}",
      },
    },
  },
  notify_on_error = true,
  format_disabled_dirs = {
    "node_modules",
    ".git",
    ".vs",
    "bin",
    "obj",
  },
}

return options
