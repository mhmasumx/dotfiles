return {
    {
      'neanias/everforest-nvim',
      version = false,
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('everforest').setup({
          background = 'hard',
          transparent_background_level = 2,
          italics = true,
          ui_contrast = "high",
          on_highlights = function(hl, palette)
            hl.BufferLineBufferSelected = {  fg= palette.green }
            hl.BufferLineDuplicateSelected = { fg= palette.green, italic=true }
            hl.NoiceCmdlinePopupBorder = { fg = palette.green }
            hl.NormalFloat = {}
            hl.FloatBorder = { fg = palette.green }
            hl.CmpBorder = { fg = palette.green }
            hl.TelescopeNormal = { fg = palette.green }
            hl.TelescopeBorder = { fg = palette.green }
            hl.NvimTreeFolderIcon = { fg = palette.green }
            hl.NvimTreeNormal = { bg = palette.none }
            hl.NvimTreeEndOfBuffer = { bg = palette.none }
            hl.EndOfBuffer = { bg = palette.none }
            hl.NavicText = { fg = palette.purple }
            hl.PlayCode = { fg = palette.green }
            hl.MiniIndentscopeSymbol = { fg = palette.green }
            hl.ScrollbarHandle = { bg = palette.bg_green }
          end,
        })
        vim.cmd([[
        colorscheme everforest
        ]])
      end,
    },
  }
