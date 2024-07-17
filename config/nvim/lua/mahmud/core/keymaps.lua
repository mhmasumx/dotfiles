-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap({"i"}, "jk", "<ESC>", { silent = true, desc = "Exit insert mode with jk" }) -- use jk to exit insert mode

-- save and quit
keymap({ 'n' }, '<C-s>', ':write!<CR>', { silent = true, desc = 'Write File' })
keymap({ 'n' }, '<C-q>', ':quitall<CR>', { noremap = true, silent = true, desc = 'Quit' })
keymap('n', 'q:', ':q<CR>')                                                                       -- Disable annoying command line thing.

keymap('n', '<leader>k', ':nohlsearch<CR>', { silent = true, desc = "Clear search highlights" })  -- Quickly clear search highlighting.

keymap("n", "x", '"_x', { silent = true })                                                        -- delete single character without copying into register
keymap('v', 'p', '"_dP')                                                                          -- Paste replace visual selection without copying it.

keymap("v", "<", "<gv", { silent = true, desc = "Indent Less" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent More" })

-- Alternate file
keymap("n", "<leader><leader>", "<C-^>", { silent = true, desc = "Last Buffer" })
keymap("n", "<leader>al", "<cmd>LspRestart all<CR>", { silent = true, desc = "Restart LSP" })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap('n', '<leader>ls', ':Lazy sync<CR>', { silent = true, desc = 'Sync lazy plugins' })
keymap('n', '<leader>zz', ':ZenMode<CR>', { silent = true, desc = 'Zen Mode' })

-- Telescope
-- keymap("n", "ff", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Find Files" })
-- keymap("n", "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" })
-- keymap(
--   "n",
--   "<leader>fg",
--   ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
--   { silent = true, desc = "Live Grep" }
-- )
-- keymap(
--   "n",
--   "<leader>fG",
--   ":lua require('mahmud.plugins.telescope').grep_current_dir()<CR>",
--   { silent = true, desc = "Live Grep Current Dir" }
-- )
-- keymap(
--   "n",
--   "<leader>fb",
--   ":lua require('mahmud.plugins.telescope').buffers()<CR>",
--   { silent = true, desc = "Open Buffers" }
-- )
-- keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true, desc = "Help Tags" })
-- keymap("n", "<leader>fH", "<cmd>Telescope highlights<CR>", { silent = true, desc = "Highlights" })
-- keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", { silent = true, desc = "Resume" })
-- keymap("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { silent = true, desc = "Pickers" })
-- keymap("n", "<leader>fs", ":lua require('telescope.builtin').git_status()<CR>", { silent = true, desc = "Git Status" })
-- keymap("n", "<leader>ff", function()
--   local themes = require("telescope.themes")
--   local theme = themes.get_dropdown()
--   require("telescope.builtin").lsp_document_symbols({
--     layout_config = theme.layout_config,
--     previewer = false,
--     results_title = false,
--     symbols = { "function" },
--   })
-- end, { silent = true, desc = "Functions In File" })
