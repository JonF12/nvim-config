vim.opt.pumheight = 20

-- auto open nvim-tree when opening nvim
vim.schedule(function()
  require("mappings")
end)

--disable text wrap
vim.opt.wrap = false

--use line endings dependant on os, windows settings
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh" --powershell if windows
  vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  vim.opt.shellxquote = ""
  vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    command = "set guicursor=a:ver25",
  })
  vim.opt.fsync = false
  -- Optimize terminal performance
  vim.g.terminal_performance_mode = true
  -- Increase these values for better UI responsiveness
  vim.g.terminal_scrollback_buffer_size = 5000
  -- Windows-specific UI performance tweaks
  vim.opt.redrawtime = 1500
  vim.opt.updatetime = 100
  vim.opt.fileformat = "dos" -- Windows line endings (CRLF)
  vim.opt.fileformats = "dos" -- Prefer Windows format
  vim.g.powershell_no_async = 0
  vim.g.powershell_no_progress = 1
else
  vim.opt.fileformat = "unix" -- Unix line endings (LF)
  vim.opt.fileformats = "unix" -- Prefer Unix format
  vim.opt.shell = "bash" -- bash if linux
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_git_timeout = 2000

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

require("custom.highlight")
