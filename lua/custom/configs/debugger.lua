local dap = require("dap")
local dapui = require("dapui")

-- DAP UI setup
dapui.setup()

-- Signs
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟡', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⭕', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📝', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='', numhl=''})

-- Adapters
dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath "data" .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
  args = {'--interpreter=vscode'}
}

-- Configurations
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      local cwd = vim.fn.getcwd()
      local files = vim.fn.globpath(cwd .. '/bin', '**/Debug/**/*.dll', 0, 1)
      local dlls = {}
      for _, file in ipairs(files) do
        if not string.find(file, "Test") then
          table.insert(dlls, file)
        end
      end
      if #dlls > 0 then
        return dlls[1]
      end
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- Auto open/close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Create a debug command to verify everything is loaded
vim.api.nvim_create_user_command("DebugStatus", function()
  print("DAP loaded:", package.loaded['dap'] ~= nil)
  print("DAPUI loaded:", package.loaded['dapui'] ~= nil)
  print("Debug adapter path exists:", vim.fn.filereadable(vim.fn.stdpath "data" .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe") == 1)
end, {})