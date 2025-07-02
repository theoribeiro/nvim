return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    opts = {
      picker = "snacks",
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            -- env = {
            --   api_key = "cmd:security find-generic-password -s gemini -w",
            -- },
            schema = {
              model = {
                default = "gemini-2.0-flash-exp",
              },
            },
          })
        end,
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            -- env = {
            --   api_key = "cmd:security find-generic-password -s gemini -w",
            -- },
            schema = {
              model = {
                default = "gemini-2.5-pro",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "snacks",
                contains_code = true,
              },
            },
          },
        },
      },
      -- strategies = {
      --   chat = {
      --     adapter = "gemini",
      --   },
      -- },
    },
  },
}
