return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 30
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,

      direction = "horizontal",
      open_mapping = [[<c-\>]],
      insert_mappings = true,
      terminal_mappings = true,
      persist_mode = true,
      -- shade_terminals = false,
    },
  },
}
