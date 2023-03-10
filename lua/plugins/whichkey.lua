return {
  {
    "folke/which-key.nvim",
    init = function()
      require("which-key").register({
        ["<leader>d"] = { name = "+debug" },
      })
    end,
  },
}
