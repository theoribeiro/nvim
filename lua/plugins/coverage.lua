return {
  {
    "andythigpen/nvim-coverage",
    opts = {
      signs = {
        covered = { text = "" },
      },
      -- lang = {
      --   rust = {
      --     coverage_command = "cargo llvm-cov report --codecov",
      --     project_files_only = false,
      --     project_files = { "src/*", "tests/*" },
      --   },
      -- },
    },
  },
}
