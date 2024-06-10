return {
  "nvim-neotest/neotest",
  opts = {
    log_level = "debug",
    adapters = {
      require("neotest-golang")({ dap_go_enabled = true }),
    },
  },
}
