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
--fix windows leaving nvim broken on powershell 7
if vim.fn.has("win32") == 1 then
  vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    command = "set guicursor=a:ver25",
  })
end

--use line endings dependant on os
if vim.fn.has("win32") == 1 then
  vim.opt.fsync = false
  vim.opt.fileformat = "dos" -- Windows line endings (CRLF)
  vim.opt.fileformats = "dos" -- Prefer Windows format
  vim.g.terminal_scrollback_buffer_size = 10000 -- Reduce buffer size
  vim.g.terminal_performance_mode = true
  vim.g.powershell_no_async = 0
  vim.g.powershell_no_progress = 1
else
  vim.opt.fileformat = "unix" -- Unix line endings (LF)
  vim.opt.fileformats = "unix" -- Prefer Unix format
end
