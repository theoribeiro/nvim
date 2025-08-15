return {
  {
    "https://github.com/fresh2dev/zellij.vim",
    -- Pin version to avoid breaking changes.
    -- tag = '0.3.*',
    lazy = false,
    init = function()
      -- Options:
      -- vim.g.zelli_navigator_move_focus_or_tab = 1
      -- vim.g.zellij_navigator_no_default_mappings = 1
    end,
    keys = {
      {
        "<C-h>",
        "<Cmd>ZellijNavigateLeft!<CR>",
        desc = "Zellij Navigate Left",
      },
      {
        "<C-l>",
        "<Cmd>ZellijNavigateRight!<CR>",
        desc = "Zellij Navigate Right",
      },
      {
        "<C-k>",
        "<Cmd>ZellijNavigateUp!<CR>",
        desc = "Zellij Navigate Up",
      },
      {
        "<C-j>",
        "<Cmd>ZellijNavigateDown!<CR>",
        desc = "Zellij Navigate Down",
      },
      {
        "<leader>zf",
        "<Cmd>ZellijNewPane<CR>",
        desc = "Zellij New Floating Pane",
      },
      {
        "<leader>zr",
        "<Cmd>ZellijNewPaneVSplit<CR>",
        desc = "Zellij New Pane Vertical Split",
      },
      {
        "<leader>zd",
        "<Cmd>ZellijNewPaneSplit<CR>",
        desc = "Zellij New Pane Split",
      },
      {
        "<leader>zt",
        "<Cmd>ZellijNewTab<CR>",
        desc = "Zellij New Tab",
      },
    },
  },
}
