return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.g.autoformat = true
    end,
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      return {
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = lsp_capabilities,
            })
          end,
          ["tsserver"] = function()
            lspconfig.tsserver.setup({
              capabilities = lsp_capabilities,
              settings = {
                completions = {
                  completeFunctionCalls = true,
                },
                -- javascript = {
                --   preferences = {
                --     importModuleSpecifier = "relative",
                --     importModuleSpecifierEnding = "minimal",
                --   },
                -- },
                -- typescript = {
                --   preferences = {
                --     importModuleSpecifier = "relative",
                --     importModuleSpecifierEnding = "minimal",
                --   },
                -- },
              },
              -- init_options = {
              --   preferences = {
              --     -- other preferences...
              --     importModuleSpecifierPreference = "relative",
              --     importModuleSpecifierEnding = "minimal",
              --   },
              -- },
            })
          end,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
}
