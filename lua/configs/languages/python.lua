local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.pyright.setup({
  root_dir = lspconfig.util.root_pattern("pyproject.toml"),
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  pylsp = {
    python = {
      venvPath = vim.fn.getcwd() .. "/.venv",
      pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
      },
    },
    plugins = {
      ruff = { enabled = true },
      mypy = {
        enabled = true,
        live_mode = true,
      },
      black = { enabled = true },
      jedi = {
        enabled = true,
        extra_paths = {},
        environment = vim.fn.getcwd() .. "/.venv/bin/python",
      },
    },
  },
})
