local cmp = require "cmp"

local M = {}

M.cmp = {
  preselect = cmp.Preselectmode.None,
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

return M
