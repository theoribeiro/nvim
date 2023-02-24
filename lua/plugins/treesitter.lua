return {
  "RRethy/nvim-treesitter-textsubjects",
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
        },
      },
    },
  },
}
