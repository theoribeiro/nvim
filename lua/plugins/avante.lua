return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {
      provider = "claude",
      hints = { enabled = false },
      file_selector = {
        provider = "snacks",
      },
    },
  },
}
