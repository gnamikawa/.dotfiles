return {
  {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope",
    -- version = false, -- telescope did only one release, so use HEAD for now
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<C-p>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      -- { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>:",  "<cmd>Telescope command_history<cr>", desc = "Command History" },
      {
        "<leader><space>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>fg",
        "<cmd>Telescope git_files<cr>",
        desc = "Find Files (git-files)",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",        desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",     desc = "Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",      desc = "Status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>",       desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",    desc = "Auto Commands" },
      { "<leader>sb", "current_buffer_fuzzy_find",          desc = "Current buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",        desc = "Commands" },
      {
        "<leader>sd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>sD",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Workspace Diagnostics",
      },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "Search Highlight Groups",
      },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>",     desc = "Jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",      desc = "Key Maps" },
      { "<leader>sl", "<cmd>Telescope loclist<cr>",      desc = "Location List" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",    desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",        desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",  desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",       desc = "Resume" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>",     desc = "Quickfix List" },
      { "<leader>sw", "<cmd>Telescoipe grep_string<cr>", desc = "Word (Root Dir)" },
      {
        "<leader>ss",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        "<cmd>Telescope lsp_workspace_symbols<cr>",
        desc = "Goto Symbol (Workspace)",
      },
    },

    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.sources.telescope").open(...)
      end
      -- local find_files_no_ignore = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   LazyVim.pick("find_files", { no_ignore = true, default_text = line })()
      -- end
      -- local find_files_with_hidden = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   LazyVim.pick("find_files", { hidden = true, default_text = line })()
      -- end

      local function find_command()
        if 1 == vim.fn.executable("rg") then
          return { "rg", "--files", "--color", "never", "-g", "!.git" }
        elseif 1 == vim.fn.executable("fd") then
          return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
        elseif 1 == vim.fn.executable("fdfind") then
          return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
        elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
          return { "find", ".", "-type", "f" }
        elseif 1 == vim.fn.executable("where") then
          return { "where", "/r", ".", "*" }
        end
      end

      return {
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            flex = {
              width = 0.9,
            },
          },
          -- prompt_prefix = " ",
          -- selection_caret = " ",
          -- -- open files in the first window that is an actual file.
          -- --           -- use the current window if no other window is availale.
          -- get_selection_window = function()
          --   local wins = vim.api.nvim_list_wins()
          --   table.insert(wins, 1, vim.api.nvim_get_current_win())
          --   for _, win in ipairs(wins) do
          --     local buf = vim.api.nvim_win_get_buf(win)
          --     if vim.bo[buf].buftype == "" then
          --       return win
          --     end
          --   end
          --   return 0
          -- end,
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["J"] = actions.preview_scrolling_down,
              ["K"] = actions.preview_scrolling_up,
            },
            n = {
              ['q'] = actions.close,
              ["J"] = actions.preview_scrolling_down,
              ["K"] = actions.preview_scrolling_up,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          current_buffer_fuzzy_find = {
            theme = "ivy"
          }
        },
      }
    end,
  },
}
