-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local transparency = (vim.fn.has("win32") ~= 1)

M.base46 = {
  theme = "doomchad",
  transparency = transparency,
}
M.ui = {
  cmp = {
    icons_left = true, -- only for non-atom styles!
    lspkind_text = false,
    icons = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false, -- will work for css lsp too
      icon = "󱓻",
    },
  },
  telescope = { style = "bordered" },
  statusline = {
    theme = "default",
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  colorify = {
    enabled = true,
    mode = "fg", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

return M
