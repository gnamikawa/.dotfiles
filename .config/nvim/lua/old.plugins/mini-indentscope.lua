return {
  {
    "echasnovski/mini.indentscope",
    lazy=false,
    config = {
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        delay = 100,
        animation = function() return 0 end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
          "Trouble",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  }
}
