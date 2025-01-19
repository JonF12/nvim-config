local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")
lspconfig.omnisharp.setup({
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()), "--settings", vim.fn.stdpath("config") .. "/omnisharp.json" },
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    if not bufnr or bufnr == 0 then
      return
    end
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].expandtab = true
    vim.bo[bufnr].softtabstop = 4
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
  enable_roslyn_analyzers = true,
  analyze_open_documents_only = true,
  formatting_options = {
    UseTabs = false, -- Use spaces
    TabSize = 4,
    IndentationSize = 4,
    MaxLineLength = 240,
  },
  organize_imports_on_format = true,
  enable_import_completion = true,
  enable_cache = true,
  enable_package_auto_restore = true,
  filetypes = { "cs", "csproj", "sln" },
})
