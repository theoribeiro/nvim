return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      -- keys[#keys + 1] = { "K", false }
      -- keys[#keys + 1] = { "gd", false }
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.eslint,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
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
