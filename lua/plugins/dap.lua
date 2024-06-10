local continue = function()
  local dap = require("dap")

  -- if dap.session() == nil then
  --   require("util.launch_json").load()
  -- end

  dap.continue()
end

local function read_env(env, env_file)
  return function()
    return coroutine.create(function(dap_run_co)
      local dotenv = require("util.dotenv")
      local extra_envs = dotenv:parse(env_file)
      if extra_envs ~= nil then
        env = vim.tbl_deep_extend("force", env, extra_envs)
      end
      coroutine.resume(dap_run_co, env)
    end)
  end
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
      dap.configurations.go = {
        {
          type = "go",
          request = "launch",
          name = "Debug",
          program = ".",
          envFile = "${fileDirname}/.env",
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
      },
    },
  },
}
