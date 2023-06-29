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
      -- debugger_cmd = { "node js-debug/src/dapDebugServer.js" },
      -- debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      -- log_console_level = vim.log.levels.DEBUG,
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
      --   {
      --     "<leader>db",
      --     function()
      --       require("dap").step_back()
      --     end,
      --     desc = "Step back",
      --   },
      --   {
      --     "<leader>dc",
      --     function()
      --       continue()
      --     end,
      --     desc = "Continue",
      --   },
      --   {
      --     "<leader>dC",
      --     function()
      --       require("dap").run_to_cursor()
      --     end,
      --     desc = "Run to cursor",
      --   },
      --   {
      --     "<leader>ds",
      --     function()
      --       require("dap").close()
      --     end,
      --     desc = "Stop",
      --   },
      --   {
      --     "<leader>dd",
      --     function()
      --       require("dap").disconnect()
      --     end,
      --     desc = "Disconnect",
      --   },
      --   {
      --     "<leader>dg",
      --     function()
      --       require("dap").session()
      --     end,
      --     desc = "Get session",
      --   },
      --   {
      --     "<leader>di",
      --     function()
      --       require("dap").step_into()
      --     end,
      --     desc = "Step into",
      --   },
      --   {
      --     "<leader>do",
      --     function()
      --       require("dap").step_over()
      --     end,
      --     desc = "Step over",
      --   },
      --   {
      --     "<leader>du",
      --     function()
      --       require("dap").step_out()
      --     end,
      --     desc = "Step out",
      --   },
      --   {
      --     "<leader>dp",
      --     function()
      --       require("dap").pause()
      --     end,
      --     desc = "Pause",
      --   },
      --   {
      --     "<leader>dr",
      --     function()
      --       require("dap").repl.toggle()
      --     end,
      --     desc = "Toggle repl",
      --   },
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
    -- dependencies = { "mfussenegger/nvim-dap" },
    --   opts = {
    --     icons = { expanded = "", collapsed = "", circular = "" },
    --
    --     layouts = {
    --       {
    --         elements = {
    --           {
    --             id = "scopes",
    --             size = 0.25,
    --           },
    --           {
    --             id = "breakpoints",
    --             size = 0.25,
    --           },
    --           {
    --             id = "stacks",
    --             size = 0.25,
    --           },
    --           {
    --             id = "watches",
    --             size = 0.25,
    --           },
    --         },
    --         position = "left",
    --         size = 40,
    --       },
    --       {
    --         elements = {
    --           {
    --             id = "repl",
    --             size = 0.5,
    --           },
    --           {
    --             id = "console",
    --             size = 0.5,
    --           },
    --         },
    --         position = "bottom",
    --         size = 0.2,
    --       },
    --     },
    --   },
    --   init = function()
    --     -- local dap, dapui = require("dap"), require("dapui")
    --     -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --     --   dapui.open()
    --     -- end
    --     -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --     --   dapui.close()
    --     -- end
    --     -- dap.listeners.before.event_exited["dapui_config"] = function()
    --     --   dapui.close()
    --     -- end
    --     vim.fn.sign_define("DapBreakpoint", {
    --       text = "",
    --       texthl = "DiagnosticSignError",
    --       linehl = "",
    --       numhl = "",
    --     })
    --     vim.fn.sign_define("DapBreakpointRejected", {
    --       text = "",
    --       texthl = "DiagnosticSignError",
    --       linehl = "",
    --       numhl = "",
    --     })
    --     vim.fn.sign_define("DapStopped", {
    --       text = "",
    --       texthl = "DiagnosticSignError",
    --       linehl = "Visual",
    --       numhl = "DiagnosticSignWarn",
    --     })
    --   end,
    keys = {
      -- {
      --   "<leader>dU",
      --   function()
      --     require("dapui").toggle({ reset = true })
      --   end,
      --   desc = "Toggle UI",
      -- },
      {
        "<A-h>",
        function()
          require("dapui").eval()
        end,
      },
    },
  },
}
