return {
  { "L3MON4D3/LuaSnip" },

  {
    "olrtg/emmet-language-server",
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "astro,css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,svelte,typescriptreact,vue",
        callback = function()
          vim.lsp.start({
            cmd = { "emmet-language-server", "--stdio" },
            root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
            init_options = {
              --- @type table<string, any> https://docs.emmet.io/customization/preferences/
              preferences = {},
              --- @type "always" | "never" defaults to `"always"`
              showexpandedabbreviation = "always",
              --- @type boolean defaults to `true`
              showabbreviationsuggestions = true,
              --- @type boolean defaults to `false`
              showsuggestionsassnippets = false,
              --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
              syntaxprofiles = {},
              --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
              variables = {},
              --- @type string[]
              excludelanguages = {},
            },
          })
        end,
      })
    end,
  },
}
