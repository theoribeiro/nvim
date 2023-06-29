return {
  -- {
  --   "jcdickinson/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({})
  --   end,
  -- },
  {
    "Exafunction/codeium.vim",
    enabled = true,
    config = function()
      -- vim.g.codeium_manual = true
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<A-m>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true, nowait = true, script = true })
      vim.keymap.set("i", "<A-f>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<A-b>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<A-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      vim.keymap.set("i", "<A-s>", function()
        vim.g.codeium_enabled = not vim.g.codeium_enabled
        if vim.g.codeium_enabled then
          print("Codeium Enabled")
        else
          print("Codeium Disabled")
        end
      end, { expr = true })
    end,
  },
}
