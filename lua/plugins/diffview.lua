return {
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gD",
        "<cmd>DiffviewOpen<cr>",
        desc = "Open DiffView",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
