return {
  "nvim-neotest/neotest",
  opts = {
    log_level = "debug",
    adapters = {
      ["neotest-go"] = {
        experimental = {
          test_table = true,
        },
      },
    },
  },
}
