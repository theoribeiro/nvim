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

-- quickfix list delete keymap
function Remove_qf_item()
  local curqfidx = vim.fn.line(".")
  local qfall = vim.fn.getqflist()

  -- Return if there are no items to remove
  if #qfall == 0 then
    return
  end

  -- Remove the item from the quickfix list
  table.remove(qfall, curqfidx)
  vim.fn.setqflist(qfall, "r")

  -- Reopen quickfix window to refresh the list
  vim.cmd("copen")

  -- If not at the end of the list, stay at the same index, otherwise, go one up.
  local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

  -- Set the cursor position directly in the quickfix window
  local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
  vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

vim.cmd("command! RemoveQFItem lua Remove_qf_item()")
vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>")
