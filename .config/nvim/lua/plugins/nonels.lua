return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local nls = require("null-ls")
            nls.setup({
                sources = {
                    nls.builtins.completion.spell,
                    nls.builtins.formatting.prettier,
                    nls.builtins.formatting.shfmt,
                    nls.builtins.formatting.stylua
                }
            })
        end
    },
}
