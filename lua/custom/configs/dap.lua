local dap = require('dap')

-- Get path to netcoredbg from mason
local mason_path = vim.fn.stdpath "data" .. "/mason"
local netcoredbg_path = mason_path .. "/packages/netcoredbg/netcoredbg/netcoredbg.exe"

dap.adapters.coreclr = {
  type = 'executable',
  command = netcoredbg_path,
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      -- Get the current working directory
      local cwd = vim.fn.getcwd()
      -- Find all dll files in the bin directory recursively
      local files = vim.fn.globpath(cwd .. '/bin', '**/Debug/**/*.dll', 0, 1)
      -- Filter out any test dlls or other unwanted dlls
      local dlls = {}
      for _, file in ipairs(files) do
        if not string.find(file, "Test") then
          table.insert(dlls, file)
        end
      end
      -- If we found any dlls, return the first one
      if #dlls > 0 then
        return dlls[1]
      end
      -- If no dll was found, ask the user
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}


-- Optional: Set up UI
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end