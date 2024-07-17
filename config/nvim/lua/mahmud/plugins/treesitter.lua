return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local parsers = require('mahmud.utils.ts_parser').parser

    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      ensure_installed = parsers,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
