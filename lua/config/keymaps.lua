-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Buffer jump" })

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open DiffView" })
vim.keymap.set("n", "<leader>gA", "<cmd>!git add -A<cr>", { desc = "Stage all files" })
