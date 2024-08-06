return {
  {
    "kevinhwang91/nvim-ufo",
    event = "LspAttach",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },
}
