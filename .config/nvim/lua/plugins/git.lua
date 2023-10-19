return {
  { "jesseduffield/lazygit" },
  { "tpope/vim-fugitive" },

  {
    "lewis6991/gitsigns.nvim",
    config = {
      numhl = true,
      word_diff = true,
    },
    keys = {
      { "<leader>gw", ":Gitsigns toggle_word_diff<CR>", desc = "Toggle inline word diff", mode = "n", noremap = true },
      { "<leader>gl", ":Gitsigns toggle_linehl<CR>", desc = "Toggle inline line diff", mode = "n", noremap = true },
    },
  },
}
