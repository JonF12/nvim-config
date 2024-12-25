local cmp = require("cmp")
local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 50
local MIN_LABEL_WIDTH = 50
local lspkind = require("lspkind")
local COMPLETION_KIND = require("custom.const.lsp_kind").Completion
local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        keyword_length = 2,
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
      performance = {
        max_view_entries = 30,
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
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = {
            menu = 50,
            abbr = 45,
          },
          ellipsis_char = "...",
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          -- before = function(entry, vim_item)
          --   -- local label = vim_item.abbr
          --   -- local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          --   -- if truncated_label ~= label then
          --   --   vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
          --   -- elseif string.len(label) < MIN_LABEL_WIDTH then
          --   --   local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
          --   --   vim_item.abbr = label .. padding
          --   -- end
          --   local kind = vim_item.kind
          --   local kind_hl_group = ("CmpItemKind%s"):format(kind)
          --
          --   vim_item.kind_hl_group = ("%sIcon"):format(kind_hl_group)
          --   vim_item.kind = (" %s "):format(COMPLETION_KIND[kind].icon)
          --   return vim_item
          -- end,
        }),
      },
      window = {
        documentation = {
          max_width = 45,
          max_height = 45,
        },
      },
    },
  },
}

return plugins
