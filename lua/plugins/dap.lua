local continue = function()
  local dap = require("dap")

  -- if dap.session() == nil then
  --   require("util.launch_json").load()
  -- end

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
  -- {
  --   "leoluz/nvim-dap-go",
  --   enabled = false,
  --   -- opts = {
  --   --   extra_debug_opts = {
  --   --     env = { TEMPORAL_DEBUG = "true" },
  --   --   },
  --   -- },
  -- },
  {
    "mfussenegger/nvim-dap",
    init = function()
      local dap = require("dap")
      dap.adapters.lldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
          args = { "--port", "${port}" },
          -- Tell codelldb which liblldb to use
          env = {
            LLDB_LIBRARY_PATH = "/opt/homebrew/opt/llvm/lib/liblldb.dylib", -- or Homebrew path
          },
        },
      }
      -- dap.configurations.rust = {
      --   {
      --     name = "TEST",
      --     type = "codelldb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --     cwd = "${workspaceFolder}",
      --     args = { "-p", "resources/tests/valid", "foo:" },
      --     stopOnEntry = false,
      --     initCommands = function()
      --       -- Find rust sysroot
      --       local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
      --       local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      --       local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"
      --
      --       local commands = {}
      --       local file = io.open(commands_file, "r")
      --       if file then
      --         for line in file:lines() do
      --           table.insert(commands, line)
      --         end
      --         file:close()
      --       end
      --
      --       table.insert(commands, 1, script_import)
      --       return commands
      --     end,
      --   },
      -- }
      dap.configurations.go = {

        {
          type = "go",
          request = "launch",
          name = "Debug",
          program = ".",
          envFile = function()
            return "${fileDirname}/.env"
          end,
          dlvCwd = "${fileDirname}",
        },
        {
          type = "go",
          request = "launch",
          name = "Debug Test",
          mode = "test",
          program = ".",
          dlvCwd = "${fileDirname}",
        },
      }
    end,
    keys = {
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>db",
        false,
      },
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
    keys = {
      {
        "<A-h>",
        function()
          require("dapui").eval()
        end,
        remap = false,
      },
    },
  },
}
