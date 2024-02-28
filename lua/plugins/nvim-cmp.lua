return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.completion.completeopt = "menu,menuone,noinsert,noselect"
      opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      opts.mapping["<S-CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      })
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })

      opts.experimental.ghost_text = false

      local default_format_fn = opts.formatting.format
      opts.formatting.format = function(entry, item)
        item = default_format_fn(entry, item)
        item.menu = " [" .. entry.source.name .. "]"
        return item
      end

      return opts

      -- return {
      --   completion = {
      --     completeopt = "menu,menuone,noinsert,noselect",
      --   },
      --   snippet = {
      --     expand = function(args)
      --       require("luasnip").lsp_expand(args.body)
      --     end,
      --   },
      --   mapping = cmp.mapping.preset.insert({
      --     ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      --     ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --     ["<C-Space>"] = cmp.mapping.complete(),
      --     ["<C-e>"] = cmp.mapping.abort(),
      --     ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --     ["<S-CR>"] = cmp.mapping.confirm({
      --       behavior = cmp.ConfirmBehavior.Replace,
      --       select = false,
      --     }),
      --     ["<Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_next_item()
      --       elseif luasnip.expand_or_jumpable() then
      --         luasnip.expand_or_jump()
      --       elseif has_words_before() then
      --         cmp.complete()
      --       else
      --         fallback()
      --       end
      --     end, { "i", "s" }),
      --     ["<S-Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_prev_item()
      --       elseif luasnip.jumpable(-1) then
      --         luasnip.jump(-1)
      --       else
      --         fallback()
      --       end
      --     end, { "i", "s" }),
      --   }),
      --   sources = cmp.config.sources({
      --     { name = "nvim_lsp" },
      --     { name = "luasnip" },
      --     { name = "buffer" },
      --     { name = "path" },
      --   }),
      --   formatting = {
      --     format = function(_, item)
      --       local icons = require("lazyvim.config").icons.kinds
      --       if icons[item.kind] then
      --         item.kind = icons[item.kind] .. item.kind
      --       end
      --       return item
      --     end,
      --   },
      --   -- experimental = {
      --   --   ghost_text = {
      --   --     hl_group = "LspCodeLens",
      --   --   },
      --   -- },
      -- }
    end,
  },
}
