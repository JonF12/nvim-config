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
    python = { "ruff_format" },
    nix = { "nixpkgs_fmt" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
  formatters = {
    prettier = {
      env = {
        LANG = "C",
        LC_ALL = "C",
      },
    },
    clang_format = {
      prepend_args = {
        "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
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
