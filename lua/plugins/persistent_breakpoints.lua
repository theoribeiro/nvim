return {
  {
    "Weissle/persistent-breakpoints.nvim",
    lazy = false,
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    },
    keys = {

      {
        "<leader>dd",
        function()
          require("persistent-breakpoints.api").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<F12>",
        function()
          require("persistent-breakpoints.api").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
    },
  },
}
