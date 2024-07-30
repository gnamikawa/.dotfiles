return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", mode = "n", desc = "Open explorer", noremap = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = {
      source_selector = {
        winbar = false,
        statusline = false,
      },
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      default_component_configs = {
        name = {
          use_git_status_colors = true,
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["l"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["-"] = "split_with_window_picker",
            ["|"] = "vsplit_with_window_picker",
            ["h"] = "close_node",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["/"] = "filter_on_submit",
            ["<esc>"] = "clear_filter",
          },
        },
      },
    },
  },
}
