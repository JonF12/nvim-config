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
  vim.api.nvim_create_autocmd("VimLeave", {
    command = "set guicursor=a:ver25",
  })
end
