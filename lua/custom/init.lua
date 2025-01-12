vim.diagnostic.config({
  float = {
    wrap = true,
  },
})
--if windows, powershell else bash
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  vim.opt.shellxquote = ""
else
  vim.opt.shell = "bash"
end
vim.opt.pumheight = 20
-- auto open nvim-tree when opening nvim
vim.schedule(function()
  require("mappings")
end)
--use line endings dependant on os, windows settings
if vim.fn.has("win32") == 1 then
  vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    command = "set guicursor=a:ver25",
  })
  vim.opt.fsync = false
  vim.opt.fileformat = "dos" -- Windows line endings (CRLF)
  vim.opt.fileformats = "dos" -- Prefer Windows format
  -- vim.g.terminal_scrollback_buffer_size = 10000 -- Reduce buffer size
  -- vim.g.terminal_performance_mode = true
  vim.g.powershell_no_async = 0
  vim.g.powershell_no_progress = 1
else
  vim.opt.fileformat = "unix" -- Unix line endings (LF)
  vim.opt.fileformats = "unix" -- Prefer Unix format
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_git_timeout = 2000

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
vim.api.nvim_set_hl(0, "@attribute", { link = "Include" })
vim.api.nvim_set_hl(0, "@attribute.builtin", { link = "Include" })
vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "Normal" })
vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "Normal" })
vim.api.nvim_set_hl(0, "@namespace.declaration", { link = "Normal" })

vim.api.nvim_set_hl(0, "@function", { link = "Normal" })
vim.api.nvim_set_hl(0, "@function.builtin", { link = "Normal" })
vim.api.nvim_set_hl(0, "@function.method", { link = "Normal" })
vim.api.nvim_set_hl(0, "@function.method.call", { link = "Normal" })
vim.api.nvim_set_hl(0, "@function.call", { link = "Normal" })

vim.api.nvim_set_hl(0, "@keyword.directive", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.storage", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "Normal" })

vim.api.nvim_set_hl(0, "Function", { link = "Normal" })
vim.api.nvim_set_hl(0, "@tag", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module.builtin", { link = "Normal" })
