-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local insertBuffers = function(buf)
  if buf ~= "NeoTree" then
    return true
  end
end
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    local bufferName = vim.api.nvim_buf_get_name(0)
    if bufferName == "" or string.find(bufferName, "filesystem | telescope") then
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
