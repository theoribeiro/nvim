return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 10000,
      },
      servers = {
        vls = {
          cmd = { "v", "ls" },
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
        tsserver = {
          -- root_dir = function(pattern)
          --   local lspconfig = require("lspconfig")
          --   return lspconfig.util.root_pattern("yarn.lock")(pattern)
          --   or lspconfig.util.root_pattern("yarn.lock", "package.json", ".git")(pattern)
          --   return vim.loop.cwd()
          -- end,
        },
        gopls = {
          on_attach = function()
            local coverage = require("coverage.config")
            local coverage_file = require("lazyvim.util").get_root() .. "/coverage.out"
            coverage.setup({
              lang = {
                go = {
                  coverage_file = coverage_file,
                },
              },
            })
          end,
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
              },
              keyOrdering = false,
              format = {
                enable = true,
              },
            },
          },
          -- on_attach = function(client, bufnr)
          --   if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
          --     local ns = vim.lsp.diagnostic.get_namespace(client.id)
          --     vim.diagnostic.disable(nil, ns)
          --   end
          -- end,
        },
        ruff_lsp = {
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
        },
        pyright = {},
        helm_ls = {},
        -- cucumber_language_server = {
        --   cmd = { }
        -- }
      },
    },
    --     init = function()
    --       local configs = require("lspconfig.configs")
    --       configs["bzl"] = {
    --         default_config = {
    --           cmd = { "bzl", "lsp", "serve" },
    --           filetypes = { "bzl" },
    --           root_dir = "", --require("lazyvim.util").get_root(),
    --           -- autostart = true,
    --         },
    --         docs = {
    --           description = [[
    -- https://docs.stack.build/docs/cli/installation
    --
    -- https://docs.stack.build/docs/vscode/starlark-language-server
    -- ]],
    --           default_config = {
    --             root_dir = [[root_pattern(".git")]],
    --           },
    --         },
    --       }
    --       require("lspconfig").bzl.setup({ root_dir = require("lazyvim.util").get_root })
    --       -- disable a keymap
    --       -- keys[#keys + 1] = { "K", false }
    --       -- keys[#keys + 1] = { "gd", false }
    --     end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.eslint,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.buildifier,
          nls.builtins.diagnostics.buildifier,
        },
      }
    end,
    -- init = function()
    --   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    --   vim.lsp.handlers["textDocument/signatureHelp"] =
    --     vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
    -- end,
  },
}
