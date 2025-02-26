return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            cwd = false,
          },
        },
      },
    },
    keys = {
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>e", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
      { "<leader>E", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
    },
  },
}
