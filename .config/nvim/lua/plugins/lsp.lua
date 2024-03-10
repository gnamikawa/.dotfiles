return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      local dontusereally = {
        method = nls.methods.DIAGNOSTICS,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        generator = {
          fn = function(params)
            local diagnostics = {}

            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
              local col, end_col = line:find("really")
              if col and end_col then
                -- null-ls fills in undefined positions
                -- and converts source diagnostics into the required format
                table.insert(diagnostics, {
                  row = i,
                  col = col,
                  end_col = end_col + 1,
                  source = "no-really",
                  message = "Don't use really!",
                  severity = vim.diagnostic.severity.WARN,
                })
              end
            end
            return diagnostics
          end,
        },
      }

      nls.register(dontusereally)

      return {
        sources = {
          dontusereally,
          nls.builtins.formatting.prettierd,
          nls.builtins.code_actions.gitsigns,
          nls.builtins.formatting.qmlformat,
          nls.builtins.formatting.remark,
          nls.builtins.formatting.shfmt,
          nls.builtins.code_actions.refactoring,
        },
      }
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   lazy = false,
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --         autocompltete = false,
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<S-j>"] = cmp.mapping.scroll_docs(-4),
  --         ["<S-k>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       formatting = {
  --         format = function(_, item)
  --           local icons = require("lazyvim.config").icons.kinds
  --           if icons[item.kind] then
  --             item.kind = icons[item.kind] .. item.kind
  --           end
  --           return item
  --         end,
  --       },
  --       experimental = {
  --         ghost_text = {
  --           hl_group = "CmpGhostText",
  --         },
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  --   ---@param opts cmp.ConfigSchema
  --   config = function(_, opts)
  --     for _, source in ipairs(opts.sources) do
  --       source.group_index = source.group_index or 1
  --     end
  --     require("cmp").setup(opts)
  --   end,
  -- },
}
