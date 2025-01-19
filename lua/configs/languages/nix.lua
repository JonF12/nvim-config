local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.nil_ls.setup({
  filetypes = { "nix" },
  capabilities = nvlsp.capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  root_dir = lspconfig.util.root_pattern("flake.nix"),
  settings = {
    ["nil"] = {
      enable = true,
      formatting = {
        command = { "nixpkgs-fmt" },
      },
      diagnostics = {
        enable = true,
        ignored = {},
        excludedFiles = {},
      },
      -- Enable completion explicitly
      completion = {
        enable = true,
        snippets = {
          enable = true,
        },
      },
    },
  },
  -- Add auto-installation if you use mason.nvim
  autostart = true,
})
