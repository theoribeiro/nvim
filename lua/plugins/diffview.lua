return {
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "Open DiffView",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
