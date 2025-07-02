return {
  -- { "rouge8/neotest-rust", dependencies = "nvim-neotest/neotest" },
  {
    "mrcjkb/rustaceanvim",
    version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
    ft = { "rust" },
    lazy = true,
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = {},
                -- ["napi-derive"] = { "napi" },
                -- ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
}
