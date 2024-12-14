local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("custom.cmp")
      return M.cmp
    end,
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "NvimTreeNormal",
          "NormalFloat",
          "NvimTreeEndOfBuffer",
          "TelescopeNormal",
          "TelescopeBorder",
        },
        exclude_groups = {},
      })
    end,
  },
}

return plugins
