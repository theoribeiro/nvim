return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vls = {
          cmd = { "v", "ls" },
        },
      },
    },
  },
}
