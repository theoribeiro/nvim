return {
  {
    "theoribeiro/goimpl.nvim",
    config = function()
      require("telescope").load_extension("goimpl")
    end,
  },
  {
    "theoribeiro/nvim-dap-go",
    config = true,
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
