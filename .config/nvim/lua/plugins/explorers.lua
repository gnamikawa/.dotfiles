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
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        window = {
          position = "current",
        },
      })
    end,
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

  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    },
    build = function()
      require("gitlab.server").build(true)
    end,
    config = function()
      require("gitlab").setup()
    end,
    keys = {
      {
        "<leader>glr",
        function()
          require("gitlab").review()
        end,
        desc = "Gitlab review",
      },
      {
        "<leader>gls",
        function()
          require("gitlab").review()
        end,
        desc = "Gitlab summary",
      },
      {
        "<leader>glA",
        function()
          require("gitlab").approve()
        end,
        desc = "Gitlab approve",
      },
      {
        "<leader>glR",
        function()
          require("gitlab").revoke()
        end,
        desc = "Gitlab revoke",
      },
      {
        "<leader>glc",
        function()
          require("gitlab").create_comment()
        end,
        desc = "Gitlab create comment",
      },
      {
        "<leader>gln",
        function()
          require("gitlab").create_note()
        end,
        desc = "Gitlab create note",
      },
      {
        "<leader>gld",
        function()
          require("gitlab").toggle_discussions()
        end,
        desc = "Gitlab discussions",
      },
      {
        "<leader>glaa",
        function()
          require("gitlab").add_assignee()
        end,
        desc = "Gitlab add assignee",
      },
      {
        "<leader>glad",
        function()
          require("gitlab").delete_assignee()
        end,
        desc = "Gitlab delete assignee",
      },
      {
        "<leader>glra",
        function()
          require("gitlab").add_reviewer()
        end,
        desc = "Gitlab add reviewer",
      },
      {
        "<leader>glrd",
        function()
          require("gitlab").delete_reviewer()
        end,
        desc = "Gitlab delete reviewer",
      },
      {
        "<leader>glp",
        function()
          require("gitlab").pipeline()
        end,
        desc = "Gitlab pipeline",
      },
      {
        "<leader>glo",
        function()
          require("gitlab").open_in_browser()
        end,
        desc = "Gitlab open_in_browser",
      },
    },
  },
}
