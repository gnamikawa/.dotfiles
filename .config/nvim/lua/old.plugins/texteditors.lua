-- Plugins that influence keybinds that are frequently used to edit text.

return {
  {
    "kevinhwang91/nvim-ufo",
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
