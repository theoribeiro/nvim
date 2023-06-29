local continue = function()
  local dap = require("dap")

  if dap.session() == nil then
    require("util.launch_json").load()
  end

  dap.continue()
end

return {
  {
    "mxsdev/nvim-dap-vscode-js",
    opts = {
      debugger_path = vim.fn.stdpath("data") .. "/vscode-js-debug", --"/mason/packages/js-debug-adapter",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      local dap = require("dap")

      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
    end,
    keys = {
      {
        "<F4>",
        function()
          require("dap").run_last()
        end,
        desc = "Continue",
      },
      {
        "<F5>",
        function()
          continue()
        end,
        desc = "Continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F23>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<A-h>",
        function()
          require("dapui").eval()
        end,
      },
    },
  },
}
