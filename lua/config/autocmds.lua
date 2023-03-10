-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    local bufferName = vim.api.nvim_buf_get_name(0)
    if bufferName == "" or string.find(bufferName, "filesystem") then
      return
    end
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    local bufferName = vim.api.nvim_buf_get_name(0)
    if bufferName == "" or string.find(bufferName, "filesystem") then
      return
    end
    vim.opt.relativenumber = true
  end,
})

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
