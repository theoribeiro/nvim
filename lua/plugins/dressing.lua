return {
  {
    "stevearc/dressing.nvim",
    opts = {
      select = {
        win_options = {
          wrap = true,
        },
      },
      input = {
        win_options = {
          wrap = true,
        },
        get_config = function(opts)
          local extra_opts = {}
          for i, v in pairs(opts) do
            extra_opts[i] = v
          end
          -- if opts.relative ~= nil then
          --   extra_opts.relative = opts.relative
          -- end
          -- if opts.width ~= nil then
          --   extra_opts.width = opts.width
          -- end
          return extra_opts
        end,
      },
    },
  },
}
