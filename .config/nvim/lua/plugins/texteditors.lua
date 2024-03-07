-- Plugins that influence keybinds that are frequently used to edit text.

return {
  { "echasnovski/mini.pairs", enabled = false },
  { "chentoast/marks.nvim" },

  {
    "svermeulen/vim-cutlass",
    lazy = false,
    keys = {
      { "x", "d", mode = "n", desc = "Cut", noremap = true },
      { "x", "d", mode = "v", desc = "Cut", noremap = true },
      { "xx", "dd", mode = "n", desc = "Cut line", noremap = true },
      { "X", "D", mode = "n", desc = "Cut line", noremap = true },
    },
  },

  {
    "fedepujol/move.nvim",
    keys = {
      { "<A-up>", "<cmd>MoveLine(-1)<CR>", desc = "Move line area down", noremap = true },
      { "<A-down>", "<cmd>MoveLine(1)<CR>", desc = "Move line area up", noremap = true },
      { "<A-right>", "<cmd>MoveWord(1)<CR>", desc = "Move word forward", noremap = true },
      { "<A-left>", "<cmd>MoveWord(-1)<CR>", desc = "Move word backward", noremap = true },
      { "<A-left>", ":MoveHBlock(-1)<CR>", desc = "Move visual area left", mode = "v", noremap = true },
      { "<A-down>", ":MoveBlock(1)<CR>", desc = "Move visual area down", mode = "v", noremap = true },
      { "<A-up>", ":MoveBlock(-1)<CR>", desc = "Move visual area up", mode = "v", noremap = true },
      { "<A-right>", ":MoveHBlock(1)<CR>", desc = "Move visual area right", mode = "v", noremap = true },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    tag = "v1.2.0",
    event = "LspAttach",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    init = function()
      vim.opt.foldenable = true
      vim.opt.foldlevelstart = -1
      vim.opt.foldlevel = 99
      vim.opt.foldmethod = "manual"
      vim.opt.foldcolumn = "4"
      vim.opt.scrolloff = 20
      vim.opt.relativenumber = false
    end,
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
  },
}
