-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "falcon",
  transparency = true,
}
M.ui = {
  cmp = {
    icons_left = false, -- only for non-atom styles!
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false, -- will work for css lsp too
      icon = "󱓻",
    },
  },
  telescope = { style = "bordered" },

  statusline = {
    theme = "minimal",

    overriden_modules = function()
      local st_modules = require("nvchad.statusline.default")
      st_modules[4] = function()
        local git = vim.b.gitsigns_status_dict
        if not git then
          return ""
        end

        local icons = {
          branch = " ",
          added = " ",
          changed = " ",
          removed = " ",
        }

        local added = git.added and git.added ~= 0 and string.format("%s%d ", icons.added, git.added) or ""
        local changed = git.changed and git.changed ~= 0 and string.format("%s%d ", icons.changed, git.changed) or ""
        local removed = git.removed and git.removed ~= 0 and string.format("%s%d ", icons.removed, git.removed) or ""

        return string.format("%s%s %s%s%s", icons.branch, git.head, added, changed, removed)
      end
      return st_modules
    end,
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

return M
