require "nvchad.mappings"

-- add yours here
local close_all_but_this = function()
  local current_bufnr = vim.api.nvim_get_current_buf()
  for _, bufnr in ipairs(vim.t.bufs) do
    if bufnr ~= current_bufnr then
      require("nvchad.tabufline").close_buffer(bufnr)
    end
  end
end

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gg", "gg0", { desc = "Go to first line first col", noremap = true })
map("n", "G", "G$", { desc = "go to last line last col", noremap = true })

-- arrow key movement
map("n", "<Left>", "h", { desc = "Move left" })
map("n", "<Down>", "j", { desc = "Move down" })
map("n", "<Up>", "k", { desc = "Move up" })
map("n", "<Right>", "l", { desc = "Move right" })

-- visual mode arrows
map("v", "<Left>", "h", { desc = "Move left" })
map("v", "<Down>", "j", { desc = "Move down" })
map("v", "<Up>", "k", { desc = "Move up" })
map("v", "<Right>", "l", { desc = "Move right" })

-- split navigation with Ctrl + Arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Window left" })
map("n", "<C-Down>", "<C-w>j", { desc = "Window down" })
map("n", "<C-Up>", "<C-w>k", { desc = "Window up" })
map("n", "<C-Right>", "<C-w>l", { desc = "Window right" })
map("n", "<leader>X", close_all_but_this, { desc = "Close All all bufs but this" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

--debugger
-- map("n", "<leader>bb", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
-- map("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Start/Continue" })
-- map("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
-- map("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
-- map("n", "<F6>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
-- map("n", "<F2>", "<cmd>DapTerminate<CR>", { desc = "Terminate" })
