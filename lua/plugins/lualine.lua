-- local winbar_section = {
--   { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--   {
--     function()
--       return require("nvim-navic").get_location()
--     end,
--     cond = function()
--       return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
--     end,
--   },
-- }

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {
          winbar = {
            "dashboard",
            "alpha",
            "starter",
            "neo-tree",
            "lazyterm",
            "aerial",
            "dap-repl",
            "dapui_scopes",
            "dapui_breakpoints",
            "dapui_stacks",
            "dapui_watches",
            "dapui_console",
          },
        },
      },
      winbar = {
        lualine_c = {
          {
            "aerial",
            -- color_correction = nil,
            -- navic_opts = nil,
            draw_empty = true,
            -- cond = function()
            --   return true
            -- end,
          },
        },
      },
      inactive_winbar = {
        lualine_c = {
          {
            "aerial",
            -- color_correction = nil,
            -- navic_opts = nil,
            draw_empty = true,
            -- cond = function()
            --   return true
            -- end,
          },
        },
      },
    },
  },
}
