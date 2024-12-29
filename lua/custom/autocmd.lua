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

-- Add this event handler
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("UFO_GROUP", { clear = true }),
  callback = function()
    vim.cmd("silent! loadview")
  end,
})

-- C/C++ use line comments instead of block comments
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
