local env_select_func = function(client, bufnr)
  local venv_selector = require("venv-selector")
  if venv_selector.get_active_venv() == nil then
    venv_selector.retrieve_from_cache()
  end
end
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
        -- pylsp = {
        --   settings = {
        --     pylsp = {
        --       plugins = {
        --         pyflakes = {
        --           enabled = false,
        --         },
        --         rope_autoimport = {
        --           enabled = true,
        --         },
        --       },
        --     },
        --   },
        -- },
        pyright = {
          on_attach = env_select_func,
        },
        basedpyright = {
          on_attach = env_select_func,
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        -- rust_analyzer = {
        --   settings = {
        --     ["rust-analyzer"] = {
        --       diagnostics = {
        --         disabled = { "needless_return" },
        --       },
        --     },
        --   },
        -- },
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
