return {
  {
    "saghen/blink.cmp",
    -- opts = function(_, opts)
    --   table.insert(opts.sources.default, "codecompanion")
    --   vim.list_extend(opts.sources.compat, { "avante_commands", "avante_mentions", "avante_files" })
    --   opts.keymap = {
    --     preset = "super-tab",
    --     ["<Tab>"] = {
    --       function(cmp)
    --         if vim.b[vim.api.nvim_get_current_buf()].nes_state then
    --           cmp.hide()
    --           return (
    --             require("copilot-lsp.nes").apply_pending_nes()
    --             and require("copilot-lsp.nes").walk_cursor_end_edit()
    --           )
    --         end
    --         if cmp.snippet_active() then
    --           return cmp.accept()
    --         else
    --           return cmp.select_and_accept()
    --         end
    --       end,
    --       "snippet_forward",
    --       "fallback",
    --     },
    --   }
    -- end,
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      completion = {
        trigger = {
          show_in_snippet = false,
        },
        list = {
          selection = {
            preselect = function(_)
              return not require("blink.cmp").snippet_active({ direction = 1 })
            end,
          },
        },
      },
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = {
          function(cmp)
            if vim.b[vim.api.nvim_get_current_buf()].nes_state then
              cmp.hide()
              return (
                require("copilot-lsp.nes").apply_pending_nes()
                and require("copilot-lsp.nes").walk_cursor_end_edit()
              )
            end
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
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
