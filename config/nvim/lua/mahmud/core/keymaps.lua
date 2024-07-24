-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
-- local opts = { noremap = true, silent = true }

keymap({ 'i' }, 'jk', '<ESC>', { silent = true, desc = 'Exit insert mode with jk' }) -- use jk to exit insert mode

-- save and quit
keymap({ 'n' }, '<C-s>', ':write!<CR>', { silent = true, desc = 'Write File' })
keymap({ 'n' }, '<C-q>', ':quitall<CR>', { noremap = true, silent = true, desc = 'Quit' })
keymap('n', 'q:', ':q<CR>') -- Disable annoying command line thing.

keymap('n', '<leader>k', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlights' }) -- Quickly clear search highlighting.

keymap('n', 'x', '"_x', { silent = true }) -- delete single character without copying into register
keymap('v', 'p', '"_dP') -- Paste replace visual selection without copying it.

keymap('v', '<S-Tab>', '<gv', { silent = true, desc = 'Indent Less' })
keymap('v', '<Tab>', '>gv', { silent = true, desc = 'Indent More' })

-- Alternate file
keymap('n', '<leader><leader>', '<C-^>', { silent = true, desc = 'Last Buffer' })

-- window management
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

keymap('n', '<leader>ls', ':Lazy sync<CR>', { silent = true, desc = 'Sync lazy plugins' })
keymap('n', '<leader>al', '<cmd>LspRestart all<CR>', { silent = true, desc = 'Restart LSP' })
keymap('n', '<leader>zz', ':ZenMode<CR>', { silent = true, desc = 'Zen Mode' })
