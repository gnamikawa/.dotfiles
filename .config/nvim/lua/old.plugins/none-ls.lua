return {
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        debug = true,
        sources = {
          -- TODO: Get rid of this after mason-null-ls is working.

          -- golang
          null_ls.builtins.formatting.gofmt,

          -- python
          null_ls.builtins.formatting.black,
          -- null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.formatting.isort,

          -- markdown
          null_ls.builtins.formatting.remark,

          -- qml
          null_ls.builtins.formatting.qmlformat,

          -- etc
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.impl,
          -- null_ls.builtins.code_actions.ts_node_action,
          null_ls.builtins.hover.printenv,
          null_ls.builtins.hover.dictionary,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          -- null_ls.builtins.formatting.eslint_d,
          -- null_ls.builtins.diagnostics.tsc,
        },
        on_attach = function(client, bufnr)
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          if client.supports_method("textDocument/formatting") then
            print("Formatter Enabled.")
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = true })
              end,
            })
          end

          -- vim.api.nvim_create_autocmd("BufWritePost", {
          --   group = augroup,
          --   buffer = bufnr,
          --   callback = function()
          --     print("<cmd>Dispatch npx tsc --noEmit --removeComments<cr>")
          --     vim.cmd.normal(":Dispatch npx tsc --noEmit --removeComments")
          --   end,
          -- })
          -- if client.supports_method("textDocument/formatting") then
          -- end
        end,
      })
    end,
  },
}
