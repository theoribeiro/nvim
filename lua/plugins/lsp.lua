return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 10000,
      },
      servers = {
        -- vls = {
        --   cmd = { "v", "ls" },
        -- },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        gopls = {
          keys = {
            {
              "<leader>ci",
              [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
              desc = "Implement interface",
            },
            { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
          },
          settings = {
            gopls = {
              analyses = {
                fieldalignment = false,
              },
            },
          },
        },
        -- tsserver = {
        -- root_dir = function(pattern)
        --   local lspconfig = require("lspconfig")
        --   return lspconfig.util.root_pattern("yarn.lock")(pattern)
        --   or lspconfig.util.root_pattern("yarn.lock", "package.json", ".git")(pattern)
        --   return vim.loop.cwd()
        -- end,
        -- },
      },
    },
  },
}
