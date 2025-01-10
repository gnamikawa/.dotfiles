return {
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = {
      auto_start_watch_mode = true,
      enable_progress_notifications = false,
      use_trouble_qflist = true,
      use_diagnostics = true,
      flags = {
        noEmit = true,
        watch = true,
      },
    },
    keys = {
      { "<leader>xc", "<cmd>TSC<cr>", desc = "Launch tsc quickfix" },
    },
  },
}
