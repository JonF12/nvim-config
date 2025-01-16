local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")
lspconfig.clangd.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
  filetypes = { "c", "cpp" },
  root_dir = lspconfig.util.root_pattern(".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git"),
  single_file_support = true,
})
