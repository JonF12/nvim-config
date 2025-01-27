--highlight options
vim.api.nvim_set_hl(0, "Function", { link = "Normal" })
vim.api.nvim_set_hl(0, "Boolean", { link = "Type" })
vim.api.nvim_set_hl(0, "Number", { link = "Type" })
vim.api.nvim_set_hl(0, "Float", { link = "Type" })

vim.api.nvim_set_hl(0, "@number", { link = "Type" })
vim.api.nvim_set_hl(0, "@number.float", { link = "Type" })
vim.api.nvim_set_hl(0, "@_parent", { link = "Type" })

vim.api.nvim_set_hl(0, "@type.builtin", { link = "Keyword" })
-- for loops should be same as keyword
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "Keyword" })
-- Macros e.g For C
vim.api.nvim_set_hl(0, "@keyword.directive.define", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.directive", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.exception", { link = "Keyword" })

-- don't higlight punctuation
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
-- dont highlight variables or modules
vim.api.nvim_set_hl(0, "@variable.parameter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module", { link = "Normal" })
vim.api.nvim_set_hl(0, "@module.builtin", { link = "Normal" })

-- xml
vim.api.nvim_set_hl(0, "xmlTag", { link = "Keyword" })
vim.api.nvim_set_hl(0, "xmlTagName", { link = "Keyword" })

--c sharp specific
vim.api.nvim_set_hl(0, "@lsp.type.property.cs", { link = "Normal" })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember.cs", { link = "Normal" })
vim.api.nvim_set_hl(0, "@variable.builtin.cs", { link = "Normal" })
