return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      local dap = require("dap")
      local util = require("lazyvim.util")
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}",
          dlvCwd = function()
            return util.get_root()
          end,
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${file}",
          dlvCwd = function()
            return util.get_root()
          end,
        },
        -- works with go.mod packages and sub packages
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "../${relativeFileDirname}",
          dlvCwd = function()
            return util.get_root()
          end,
        },
      }
    end,
    keys = {
      {
        "<leader>db",
        function()
          require("dap").step_back()
        end,
        desc = "Step back",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to cursor",
      },
      {
        "<leader>dd",
        function()
          require("dap").disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "<leader>dg",
        function()
          require("dap").session()
        end,
        desc = "Get session",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle repl",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
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
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      icons = { expanded = "", collapsed = "", circular = "" },

      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 0.2,
        },
      },
    },
    init = function()
      -- local dap, dapui = require("dap"), require("dapui")
      -- dap.listeners.after.event_initialized["dapui_config"] = function()
      --   dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })
    end,
    keys = {
      {
        "<leader>dU",
        function()
          require("dapui").toggle({ reset = true })
        end,
        desc = "Toggle UI",
      },
      {
        "<A-h>",
        function()
          require("dapui").eval()
        end,
      },
    },
  },
}
