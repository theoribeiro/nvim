return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    opts = {
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
      },
      strategies = {
        chat = {
          adapter = "gemini",
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "fzf_lua",
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
