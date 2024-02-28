return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
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
  {
    "rmehri01/onenord.nvim",
    opts = function(_, opts)
      local colors = require("onenord.colors").load()
      local myopts = {
        styles = {
          diagnostics = "undercurl",
        },
        custom_highlights = {
          -- NormalFloat = { bg = colors.light_gray },

          LeapBackdrop = { link = "LightspeedGreyWash" },
          LeapLabelPrimary = { link = "LightspeedLabel" },
          LeapLabelSecondary = { link = "LightspeedLabelDistant" },
          DebugBreakpoint = { fg = colors.red },
          DebugBreakpointLine = { fg = colors.red },
          DebugHighlight = { fg = colors.blue },
          DebugHighlightLine = { fg = colors.purple },
          NvimDapVirtualText = { fg = colors.cyan },
          DapUIScope = { bg = colors.blue, fg = colors.bg },
          DapUIType = { fg = colors.blue },
          DapUIDecoration = { fg = colors.blue },
          DapUIModifiedValue = { fg = colors.cyan },
          DapUIThread = { fg = colors.purple },
          DapUIStoppedThread = { bg = colors.purple, fg = colors.bg },
          -- DapUIFloatBorder = { bg = config.options.transparency and "NONE" or colors.bg, fg = colors.gray },
          DapUILineNumber = { fg = colors.gray },
          DapUIFrameName = { fg = colors.fg },
          DapUISource = { fg = colors.purple },
          DapUIBreakpointsPath = { bg = colors.yellow, fg = colors.bg },
          DapUIBreakpointsInfo = { fg = colors.fg },
          DapUIBreakpointsCurrentLine = { fg = colors.yellow },
          DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
          DapUIWatchesEmpty = { bg = colors.red, fg = colors.bg },
          DapUIWatchesValue = { fg = colors.red },
          DapUIWatchesError = { fg = colors.red },
          DapUIPlayPause = { fg = colors.green },
          DapUIRestart = { link = "DapUIPlayPause" },
          DapUIStop = { fg = colors.red },
          DapUIDisconnect = { link = "DapUIStop" },
          DapUIStepInto = { fg = colors.purple },
          DapUIStepOver = { link = "DapUIStepInto" },
          DapUIStepBack = { link = "DapUIStepInto" },
          DapUIStepOut = { link = "DapUIStepInto" },
        },
      }
      return vim.tbl_extend("force", opts, myopts)
    end,
  },
}
