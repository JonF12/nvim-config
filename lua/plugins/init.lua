local dap_config = require("custom.dapconfig")
return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require("configs.conform"),
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = dap_config.config_dap,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "nicholasmata/nvim-dap-cs",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "json-lsp",
        "yaml-language-server",
        "omnisharp",
        "python-lsp-server",
        "denopls",
        "nil",
        "delve",
        "templ",
        "prettier",
        "csharpier",
        "eslint_d",
        "netcoredbg",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "nix",
        "lua",
        "go",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "templ",
        "c_sharp",
        "python",
      },
    },
  },
}
