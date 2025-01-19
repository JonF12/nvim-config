local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

--Note, the below LSP is not managed by mason but rather by nix package manager
--This is because it's easier for the lsp to have access to the nix-pkgs
--Otherwise, it has to access the nix packages from the outside which makes the autocomplete and other lsp features not work
lspconfig.nixd.setup({
  cmd = { "nixd" },
  capabilities = nvlsp.capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixpkgs-fmt" },
      },
      options = {
        home_manager = {},
      },
    },
  },
})
