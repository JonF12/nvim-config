-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cs",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--     vim.opt_local.softtabspot = 4
--   end,
-- })

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o", "c" })
    vim.opt_local.formatoptions:remove("t")
  end,
})
