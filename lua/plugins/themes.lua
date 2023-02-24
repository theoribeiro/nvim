return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
        highlights = {
          LeapBackdrop = {
            link = "Comment",
          },
          LeapMatch = {
            fg = "white",
          },
          LeapLabelPrimary = {
            fg = "#e34646",
            style = "bold,underline",
          },
          LeapLabelSecondary = {
            fg = "#346eeb",
            style = "bold",
          },
        },
      })
    end,
  },
  { "folke/tokyonight.nvim", lazy = false },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  "EdenEast/nightfox.nvim",
  "NTBBloodbath/doom-one.nvim",
  "kvrohit/mellow.nvim",
  "loctvl842/monokai-pro.nvim",
  "yong1le/darkplus.nvim",
  {
    "rmehri01/onenord.nvim",
    opts = {
      custom_highlights = {
        LeapBackdrop = { link = "LightspeedGreyWash" },
        LeapLabelPrimary = { link = "LightspeedLabel" },
        LeapLabelSecondary = { link = "LightspeedLabelDistant" },
      },
    },
  },
}
