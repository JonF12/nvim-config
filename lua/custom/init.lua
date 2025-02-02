vim.opt.pumheight = 20

-- auto open nvim-tree when opening nvim
vim.schedule(function()
  require("mappings")
end)

--disable text wrap
vim.opt.wrap = false

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

