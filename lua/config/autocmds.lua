-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    -- vim.notify("InsertEnter", vim.log.levels.ERROR)
    local bufferName = vim.api.nvim_buf_get_name(0)
    if bufferName == "" or string.find(bufferName, "filesystem") then
      return
    end
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    -- vim.notify("InsertLeave", vim.log.levels.ERROR)
    local bufferName = vim.api.nvim_buf_get_name(0)
    if bufferName == "" or string.find(bufferName, "filesystem") then
      return
    end
    vim.opt.relativenumber = true
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     require("util.launch_json").load()
--   end,
-- })

-- vim.api.nvim_create_autocmd("NormalEnter", {
--   callback = function()
--     vim.notify("NormalEnter", vim.log.levels.ERROR)
--   end,
-- })

-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     local float_opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = "rounded",
--       source = "always", -- show source in diagnostic popup window
--       prefix = " ",
--     }
--
--     if not vim.b.diagnostics_pos then
--       vim.b.diagnostics_pos = { nil, nil }
--     end
--
--     local cursor_pos = vim.api.nvim_win_get_cursor(0)
--     if
--       (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
--       and #vim.diagnostic.get() > 0
--     then
--       vim.diagnostic.open_float(nil, float_opts)
--     end
--
--     vim.b.diagnostics_pos = cursor_pos
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   pattern = "*",
--   callback = function()
--     if
--       ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--       and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require("luasnip").session.jump_active
--     then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("CursorMovedI", {
  pattern = "*",
  callback = function(ev)
    local ls = require("luasnip")
    if not ls.session or not ls.session.current_nodes[ev.buf] or ls.session.jump_active then
      return
    end

    local current_node = ls.session.current_nodes[ev.buf]
    local current_start, current_end = current_node:get_buf_position()
    current_start[1] = current_start[1] + 1 -- (1, 0) indexed
    current_end[1] = current_end[1] + 1 -- (1, 0) indexed
    local cursor = vim.api.nvim_win_get_cursor(0)

    if
      cursor[1] < current_start[1]
      or cursor[1] > current_end[1]
      or cursor[2] < current_start[2]
      or cursor[2] > current_end[2]
    then
      ls.unlink_current()
    end
  end,
})
