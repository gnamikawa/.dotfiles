return {
  "svermeulen/vim-cutlass",
  keys = {
    { "x",  "d",  mode = 'n', desc = "Cut",      noremap = true },
    { "x",  "d",  mode = 'v', desc = "Cut",      noremap = true },
    { "xx", "dd", mode = 'n', desc = "Cut line", noremap = true },
    { "X",  "D",  mode = 'n', desc = "Cut line", noremap = true },
  }
}
