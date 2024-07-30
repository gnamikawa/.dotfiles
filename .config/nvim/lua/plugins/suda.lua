return {
  "lambdalisue/vim-suda",
  lazy = false,
  cmd = { "SudaWrite", "SudaRead" },
  init = function()
    vim.g.suda_smart_edit = 1
  end,
}
