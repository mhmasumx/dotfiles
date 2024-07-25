return {
  'rmagatti/goto-preview',
  config = true,
  lazy = true,
  keys = {
    {
      'gp',
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      silent = true,
      remap = false,
      desc = 'Go to doc preview',
    },
  },
}
