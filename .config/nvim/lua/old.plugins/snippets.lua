return {
  { "L3MON4D3/LuaSnip" },
  {
    "danymat/neogen",
    lazy = false,
    config = true,
    keys = {
      {
        "<leader>ck",
        function()
          require("neogen").generate({
            type = "func", -- the annotation type to generate. Currently supported: func, class, type, file
          })
        end,
        desc = "Create Docstring",
        mode = "n",
        noremap = true,
      },
    },
  },
}
