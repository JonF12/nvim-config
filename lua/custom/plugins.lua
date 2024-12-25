local cmp = require("cmp")
local lspkind = require("lspkind")

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 40
local MIN_LABEL_WIDTH = 40
local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        keyword_length = 2,
        col_offset = -3,
        side_padding = 0,
      },
      performance = {
        max_view_entries = 50,
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
          mode = "symbol_text",
          maxwidth = {
            menu = 40,
            abbr = 33,
          },
          show_labelDetails = false, -- show labelDetails in menu. Disabled by default

          -- before = function(entry, vim_item)

          --   local kind = vim_item.kind
          --   local kind_hl_group = ("CmpItemKind%s"):format(kind)
          --
          --   vim_item.kind_hl_group = ("%sIcon"):format(kind_hl_group)
          --   vim_item.kind = (" %s "):format(COMPLETION_KIND[kind].icon)
          --   return vim_item
          -- end,
          before = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = (strings[1] or "")
            kind.menu = (strings[2] or "")

            local label = kind.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
              kind.abbr = truncated_label
            elseif string.len(label) < MIN_LABEL_WIDTH then
              local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
              kind.abbr = label .. padding
            end
            return kind
          end,
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
