return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    priority = 1000,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    priority = 999,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "typescript-language-server",    -- TS/JS
        "json-lsp",                     -- JSON
        "yaml-language-server",         -- YAML
        "omnisharp",       -- C#
        "denopls",          --deno
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",
        "go",
        "vimdoc",
        
        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        
        -- c#
        "c_sharp",
      },
    },
  },
}
