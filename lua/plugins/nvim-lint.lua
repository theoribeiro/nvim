return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "/Users/theoribeiro/.config/.markdownlint.yaml", "--" },
      },
    },
    linters_by_ft = {
      go = { "golangcilint" },
    },
  },
}
