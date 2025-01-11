local cmp = require("cmp")
local lspkind = require("lspkind")

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
          cmp.config.compare.exact,
          cmp.config.compare.offset,
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
          show_labelDetails = false,
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

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    if filetype == "yaml" then
      return "indent" -- Single provider for yaml
    end
    return { "lsp", "indent" } -- Main and fallback for others
  end,
})
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
return plugins
