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
}
