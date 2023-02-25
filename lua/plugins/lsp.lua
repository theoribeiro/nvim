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
      },
    },
  },
}
