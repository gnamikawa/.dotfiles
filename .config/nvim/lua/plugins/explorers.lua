return {
  { "rbong/vim-flog", enabled = false },
  { "xarthurx/taskwarrior.vim", enabled = false },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sG",
        function()
          require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
        end,
        desc = "Search word under cursor",
        mode = "n",
        noremap = true,
      },
    },
  },

  -- {
  --   "axkirillov/easypick.nvim",
  --   lazy = false,
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     local easypick = require("easypick")
  --     local base_branch = "master"
  --     local previewers = require("telescope.previewers")
  --
  --     local delta = previewers.new_termopen_previewer({
  --       get_command = function(entry)
  --         -- note we can't use pipes
  --         -- this command is for git_commits and git_bcommits
  --         return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
  --
  --         -- this is for status
  --         -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
  --         -- just do an if and return a different command
  --         -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
  --       end,
  --     })
  --
  --     local my_git_commits = function(opts)
  --       local builtin = require("telescope.builtin")
  --       opts = opts or {}
  --       opts.previewer = delta
  --
  --       builtin.git_commits(opts)
  --     end
  --
  --     easypick.setup({
  --       pickers = {
  --         -- add your custom pickers here
  --         -- below you can find some examples of what those can look like
  --
  --         -- diff current branch with base_branch and show files that changed with respective diffs in preview
  --         {
  --           -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
  --           name = "ls",
  --           -- the command to execute, output has to be a list of plain text entries
  --           command = "ls",
  --           -- specify your custom previwer, or use one of the easypick.previewers
  --           previewer = easypick.previewers.default(),
  --         },
  --
  --         -- diff current branch with base_branch and show files that changed with respective diffs in preview
  --         {
  --           name = "changed_files",
  --           command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
  --           -- previewer = easypick.previewers.default(),
  --           previewer = easypick.previewers.file_diff(),
  --         },
  --
  --         -- list files that have conflicts with diffs in preview
  --         {
  --           name = "conflicts",
  --           command = "git diff --name-only --diff-filter=U --relative",
  --           previewer = easypick.previewers.file_diff(),
  --         },
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "<leader>gf", "<cmd>Easypick changed_files<CR>", desc = "Search changed files", mode = "n", noremap = true },
  --   },
  -- },

  {
    "airblade/vim-gitgutter",
    config = {
      vim.g.gitgutter_highlight_linenrs == 1,
      vim.g.gitgutter_map_keys == 0,
    },
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
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["l"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            -- ["P"] = { "toggle_preview", config = { use_float = true } },
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            -- ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["h"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
          },
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
          require("gitlab").summary()
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

  {
    "kelly-lin/ranger.nvim",
    lazy = false,
    config = function()
      require("ranger-nvim").setup({ replace_netrw = false, enable_cmds = true, select_current_file = true })
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
}
