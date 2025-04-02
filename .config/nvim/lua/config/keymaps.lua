-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function delete_qf_entry()
  local qf_list = vim.fn.getqflist()
  local idx = vim.fn.line(".")
  if idx > 0 and idx <= #qf_list then
    table.remove(qf_list, idx)
    vim.fn.setqflist(qf_list, "r")
    vim.cmd("copen")
  end
end

-- local function clear_qf_list()
--   vim.fn.setqflist({})
-- end

-- Define quickfix-specific keymaps when the quickfix window is focused
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf", -- Only apply in quickfix
  callback = function()
    local map = require("lazyvim.util").safe_keymap_set
    map("n", "dd", delete_qf_entry, { buffer = true, desc = "Delete Quickfix Entry" })
    -- map("n", "dc", clear_qf_list, { buffer = true, desc = "Clear Quickfix List" })
  end,
})
