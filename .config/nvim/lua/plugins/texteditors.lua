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
    lazy = false,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require("ufo").setup()
    end,
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        mode = "n",
        desc = "Open all folds",
        noremap = true,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        mode = "v",
        desc = "Close all folds",
        noremap = true,
      },
    },
  },
}
