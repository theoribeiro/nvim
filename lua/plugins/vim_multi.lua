return {
  {
    "mg979/vim-visual-multi",
    init = function()
      -- vim.cmd([[
      -- let g:VM_maps = {}
      -- let g:VM_maps["Select Cursor Down"] = "<A-Down>"
      -- let g:VM_maps["Select Cursor Up"] = "<A-Up>"
      -- ]])
      vim.g.VM_maps = {
        ["Select Cursor Down"] = "<S-A-Down>",
        ["Add Cursor Down"] = "<A-Down>",
        ["Select Cursor Up"] = "<S-A-Up>",
        ["Add Cursor Up"] = "<A-Up>",
      }
      vim.g.VM_highlight_matches = ""
    end,
  },
}
