return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      table.insert(opts.sources.default, "codecompanion")
      vim.list_extend(opts.sources.compat, { "avante_commands", "avante_mentions", "avante_files" })
    end,
  },
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
    config = function()
      -- monkeypatch cmp.ConfirmBehavior for Avante
      require("cmp").ConfirmBehavior = {
        Insert = "insert",
        Replace = "replace",
      }
    end,
  },
}
