return {
  {
    "theoribeiro/goimpl.nvim",
    config = function()
      require("telescope").load_extension("goimpl")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = true,
    dev = true,
    opts = {
      debug_config = {
        type = "go",
        name = "Test Debug",
        request = "launch",
        mode = "test",
        program = ".",
        dlvCwd = "${fileDirname}",
      },
    },
  },
}
