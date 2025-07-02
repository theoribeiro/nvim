return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ravitemer/mcphub.nvim",
    },
    opts = {
      provider = "copilot",
      hints = { enabled = false },
      -- cursor_applying_provider = "groq", -- In this example, use Groq for applying, but you can also use any provider you want.
      behaviour = {
        auto_apply_diff_after_generation = false,
        -- enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },
      rag_service = {
        enabled = false, -- Enables the RAG service
        host_mount = os.getenv("HOME") .. "/Dev", -- Host mount path for the rag service
        provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
        llm_model = "gpt-4o-mini", -- The LLM model to use for RAG service
        embed_model = "text-embedding-3-small", -- The embedding model to use for RAG service
        endpoint = "https://api.openai.com/v1", -- The API endpoint for RAG service
      },
      -- copilot = {
      --   model = "o3-mini",
      --   temperature = 0,
      --   max_tokens = 8192,
      -- },
      providers = {
        -- copilot = {
        --   model = "claude-3.7-sonnet",
        --   extra_request_body = {
        --     max_tokens = 64000,
        --   },
        --   code_editing_commands = true, -- Enable code editing commands
        -- },
        groq = { -- define groq provider
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.3-70b-versatile",
          extra_request_body = {
            max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
          },
        },
        -- copilotgemini25pro = {
        --   __inherited_from = "copilot",
        --   model = "gemini-2.5-pro",
        --   extra_request_body = {
        --     max_tokens = 1024000,
        --   },
        -- },
        -- copilotgpt41 = {
        --   __inherited_from = "copilot",
        --   model = "gpt-4.1",
        --   extra_request_body = {
        --     max_tokens = 1024000,
        --   },
        -- },
        -- copilot_o4_mini = {
        --   __inherited_from = "copilot",
        --   model = "o4-mini",
        --   extra_request_body = {
        --     max_tokens = 1024000,
        --   },
        -- },
        -- copilotclaude4 = {
        --   __inherited_from = "copilot",
        --   model = "claude-sonnet-4",
        --   extra_request_body = {
        --     max_tokens = 64000,
        --   },
        -- },
      },
      file_selector = {
        provider = "snacks",
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      -- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      -- custom_tools = { --function()
      --   -- return {
      --   -- require("mcphub.extensions.avante").mcp_tool(),
      --   {
      --     name = "run_rust_diagnostics", -- Unique name for the tool
      --     description = "Run Rust files diagnostics", -- Description shown to AI
      --     command = "cargo check", -- Shell command to execute
      --     param = { -- Input parameters (optional)
      --       fields = {},
      --     },
      --     returns = { -- Expected return values
      --       {
      --         name = "result",
      --         description = "Result of the fetch",
      --         type = "string",
      --       },
      --       {
      --         name = "error",
      --         description = "Error message if the fetch was not successful",
      --         type = "string",
      --         optional = true,
      --       },
      --     },
      --     func = function(params, on_log, on_complete) -- Custom function to execute
      --       return vim.fn.system("cargo check")
      --     end,
      --   },
      --   {
      --     name = "run_go_tests", -- Unique name for the tool
      --     description = "Run Go unit tests and return results", -- Description shown to AI
      --     command = "go test -v ./...", -- Shell command to execute
      --     param = { -- Input parameters (optional)
      --       type = "table",
      --       fields = {
      --         {
      --           name = "target",
      --           description = "Package or directory to test (e.g. './pkg/...' or './internal/pkg')",
      --           type = "string",
      --           optional = true,
      --         },
      --       },
      --     },
      --     returns = { -- Expected return values
      --       {
      --         name = "result",
      --         description = "Result of the fetch",
      --         type = "string",
      --       },
      --       {
      --         name = "error",
      --         description = "Error message if the fetch was not successful",
      --         type = "string",
      --         optional = true,
      --       },
      --     },
      --     func = function(params, on_log, on_complete) -- Custom function to execute
      --       local target = params.target or "./..."
      --       return vim.fn.system(string.format("go test -v %s", target))
      --     end,
      --   },
      -- }, --end,
    },
  },
}
