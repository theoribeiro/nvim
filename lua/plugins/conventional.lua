return {
  {
    "theoribeiro/conventional.nvim",
    dir = "~/Dev/tools/conventional.nvim/",
    config = function(_, opts)
      require("conventional").setup(opts)
    end,
  },
}
