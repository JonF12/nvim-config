local config_dap = function()
  local dap = require "dap"
  local ui = require "dapui"

  require("dapui").setup()
  require("dap-go").setup()

  vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
  vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Step Out" })

  -- Add highlight groups for DAP signs
  vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff0000" }) -- Red
  vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#0000ff" }) -- Blue
  vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#00ff00" }) -- Green
  vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ffff00" }) -- Yellow
  vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#ff6b6b" }) -- Light red

  -- Then your existing sign definitions
  vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "🔵", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
  )
  vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DapLogPoint", linehl = "", numhl = "" })
  vim.fn.sign_define(
    "DapStopped",
    { text = "👉", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "⭕", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
  )

  dap.listeners.before.attach.dapui_config = function()
    ui.open()
  end

  dap.listeners.before.launch.dapui_config = function()
    ui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
  end
end

return {
  config_dap = config_dap,
}
