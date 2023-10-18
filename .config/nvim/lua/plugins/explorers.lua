return {
  { "rbong/vim-flog", enabled = false },
  { "xarthurx/taskwarrior.vim", enabled = false },

  {
    "sindrets/diffview.nvim",
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open side-by-side diff" } },
    enabled = false,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "ribelo/taskwarrior.nvim",
    keys = {
      {
        "<leader>t",
        desc = "Taskwarrior",
      },
      {
        "<leader>tt",
        function()
          require("taskwarrior_nvim").browser({ "ready" })
        end,
        desc = "Ongoing tasks",
        mode = "n",
        noremap = true,
      },
    },
  },
}
