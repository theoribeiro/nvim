return {
  "nvim-neotest/neotest",
  opts = {
    log_level = "debug",
    adapters = {
      require("neotest-golang")({ testify_enabled = true }),
    },
  },
}
