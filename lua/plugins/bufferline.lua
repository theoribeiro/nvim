return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "<leader>bj",
        "<cmd>BufferLinePick<cr>",
        desc = "Buffer jump",
      },
      {
        "<leader>bl",
        "<cmd>BufferLineCloseLeft<cr>",
        desc = "Close buffers to the left",
      },
      {
        "<leader>br",
        "<cmd>BufferLineCloseRight<cr>",
        desc = "Close buffers to the right",
      },
      {
        "<leader>.",
        "<cmd>e #<cr>",
        desc = "Switch to Other Buffer",
      },
      {
        "<leader>`",
        nil,
      },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
}
