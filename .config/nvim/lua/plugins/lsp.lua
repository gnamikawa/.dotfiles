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
          -- typescript
          nls.builtins.formatting.prettierd,

          -- golang
          nls.builtins.formatting.gofmt,

          -- python
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.pylint,
          nls.builtins.formatting.isort,

          -- markdown
          nls.builtins.formatting.remark,

          -- qml
          nls.builtins.formatting.qmlformat,

          -- etc
          nls.builtins.code_actions.gitsigns,
          nls.builtins.formatting.shfmt,
          nls.builtins.code_actions.refactoring,
          nls.builtins.code_actions.impl,
          -- nls.builtins.code_actions.ts_node_action,
          nls.builtins.hover.printenv,
          nls.builtins.hover.dictionary,
        },
      }
    end,
  },
}
