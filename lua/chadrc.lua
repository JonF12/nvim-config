-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everblush",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mappings = {
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start/Continue debugging" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "Step into" },
    ["<leader>do"] = { "<cmd> DapStepOver <CR>", "Step over" },
    ["<leader>dO"] = { "<cmd> DapStepOut <CR>", "Step out" },
    ["<leader>du"] = { 
      function()
        require("dapui").toggle()
      end,
      "Toggle DAP UI"
    },
  }
}

return M
