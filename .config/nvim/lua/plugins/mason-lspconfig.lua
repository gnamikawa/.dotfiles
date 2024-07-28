return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server)
          local lspconfig = require("lspconfig")
          lspconfig[server].setup({})
        end,
      })
    end,
  },
}
