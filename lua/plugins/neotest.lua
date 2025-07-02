return {
  "nvim-neotest/neotest",
  lazy = true,
  opts = function(_, opts)
    opts.log_level = "debug"
    opts.adapters = {
      require("neotest-golang")({ testify_enabled = true }),
      require("rustaceanvim.neotest"),
    }
    return opts
  end,
}
