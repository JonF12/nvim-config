vim.opt.pumheight = 20

-- auto open nvim-tree when opening nvim
vim.schedule(function()
  require("mappings")
end)

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

--highlight options

vim.api.nvim_set_hl(0, "Function", { link = "Normal" })
vim.api.nvim_set_hl(0, "Boolean", { link = "Type" })
vim.api.nvim_set_hl(0, "Number", { link = "Type" })
vim.api.nvim_set_hl(0, "Float", { link = "Type" })

vim.api.nvim_set_hl(0, "@number", { link = "Type" })
vim.api.nvim_set_hl(0, "@number.float", { link = "Type" })
vim.api.nvim_set_hl(0, "@_parent", { link = "Type" })
vim.api.nvim_set_hl(0, "@attribute.builtin", { link = "Include" })

vim.api.nvim_set_hl(0, "@type.builtin", { link = "Keyword" })
-- for loops should be same as keyword
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "Keyword" })
-- Macros e.g For C
vim.api.nvim_set_hl(0, "@keyword.directive.define", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.directive", { link = "Normal" })
-- don't higlight punctuation
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
-- dont highlight variables or modules
vim.api.nvim_set_hl(0, "@variable.parameter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module.builtin", { link = "Normal" })
--attribute override so it looks different
vim.api.nvim_set_hl(0, "@attribute", { link = "Include" })

-- xml
vim.api.nvim_set_hl(0, "xmlTag", { link = "Keyword" })
vim.api.nvim_set_hl(0, "xmlTagName", { link = "Keyword" })
--c sharp specific
vim.api.nvim_set_hl(0, "@property.c_sharp", { link = "Normal" })
vim.api.nvim_set_hl(0, "@constructor.c_sharp", { link = "Normal" })
vim.api.nvim_set_hl(0, "@constant.builtin.c_sharp", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@variable.member.c_sharp", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "@function.method.call.c_sharp", { link = "Normal" })
vim.api.nvim_set_hl(0, "@function.method.c_sharp", { link = "Normal" })

--C
