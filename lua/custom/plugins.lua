local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("custom.configs.debugger") -- We'll create this file for all debug settings
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "typescript-language-server",   -- TS/JS
        "json-lsp",                     -- JSON
        "yaml-language-server",         -- YAML
        "csharp-language-server",       -- C#
        "gopls",                        -- GoLang
        "denopls",
        -- Formatters
        "prettier",                     -- JS/TS/JSON/YAML
        "csharpier",                    -- C#
        
        -- Linters
        "eslint_d",                     -- JS/TS
        
        -- DAP (Debugger)
        "js-debug-adapter",             -- JS/TS debugging
        "netcoredbg",                   -- C# debugging
      },
    },
  },
}

return plugins
