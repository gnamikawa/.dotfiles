return {
  {
    lazy = false,
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    opts = {},
    keys = {
      {
        "<leader>cr",
        ":IncRename " .. vim.fn.expand("<cword>"),
        mode = "n",
        desc = "Rename under cursor",
        noremap = true,
      },
    },
  },
}
