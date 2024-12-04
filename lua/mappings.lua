require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', 'gg', 'gg0', { desc = "Go to first line first col", noremap = true })
map('n', 'G', 'G$', { desc = "go to last line last col", noremap = true })


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

-- DAP
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Start/Continue Debugging" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle Debug UI" })

-- Telescope live grep mapping
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

-- optionally disable hjkl
-- map("n", "h", "<nop>")
-- map("n", "j", "<nop>")
-- map("n", "k", "<nop>")
-- map("n", "l", "<nop>")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
