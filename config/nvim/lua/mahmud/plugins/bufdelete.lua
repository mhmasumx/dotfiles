return {
  'famiu/bufdelete.nvim',
  keys = {
    {
      '<C-x>',
      ':Bdelete<CR>',
      silent = true,
      remap = false,
      desc = 'Close current split without session close',
    },
    { '<S-x>', ':bufdo Bdelete<CR>', { desc = 'Close' } },
  },
}
