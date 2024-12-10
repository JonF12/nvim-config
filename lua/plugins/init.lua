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
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = config_dap,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "json-lsp",
        "yaml-language-server",
        "omnisharp",
        "denopls",
        "delve",
        "templ",
        "prettier",
        "csharpier",
        "eslint_d",
        "netcoredbg",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "go",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "templ",
        "c_sharp",
      },
    },
  },
}
