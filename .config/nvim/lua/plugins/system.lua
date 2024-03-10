return {
  {
    "folke/noice.nvim",

    lazy = false,

    dependencies = {
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },

    opt = {
      presets = {
        inc_rename = true,
      },
    },

    config = {
      cmdline = {
        view = "cmdline_popup",
      },
      notify = {
        -- popup: powered by nui.nvim
        -- split: powered by nui.nvim
        -- notify: powered by nvim-notify
        -- virtualtext: shows the message as virtualtext (for example for search_count)
        -- mini: similar to notifier.nvim & fidget.nvim
        -- notify_send: generate a desktop notification
        view = "mini",
      },
    },
  },

  {
    "smjonas/inc-rename.nvim",

    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>cr",
        ":IncRename " .. vim.fn.expand("<cword>"),
        mode = "n",
        desc = "Rename under cursor",
        noremap = true,
      },
    },
    lazy = false,
  },

  {
    "lambdalisue/suda.vim",

    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
}
