return {
  "folke/edgy.nvim",
  -- opts = {
  --   animate = {
  --     enabled = false,
  --   },
  --   left = {
  --     {
  --       title = "Neo-Tree",
  --       ft = "neo-tree",
  --       filter = function(buf)
  --         return vim.b[buf].neo_tree_source == "filesystem"
  --       end,
  --       pinned = true,
  --       open = function()
  --         vim.api.nvim_input("<esc><space>e")
  --       end,
  --       size = { height = 0.5 },
  --     },
  --     { title = "Neotest Summary", ft = "neotest-summary" },
  --     "neo-tree",
  --   },
  -- },
  opts = function(_, opts)
    opts.animate = { enabled = false }
    opts.left = vim.tbl_filter(function(item)
      return item.title ~= "Neo-Tree Git" and item.title ~= "Neo-Tree Buffers"
    end, opts.left)
    -- table.insert(opts.left, {
    --   title = "Aerial",
    --   ft = "aerial",
    --   pinned = true,
    --   open = "AerialOpen",
    -- })
    --
    -- opts.right = vim.tbl_filter(function(item)
    --   return item.title ~= "Aerial"
    -- end, opts.right)
  end,
}
