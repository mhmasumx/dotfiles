return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    local disabled_filetype_indentscope = { 'lspinfo', 'neotest-output-panel' }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = disabled_filetype_indentscope,
      callback = function()
        vim.g.miniindentscope_disable = true
      end,
    })

    -- require("mini.cursorword").setup()
    require('mini.indentscope').setup({
      symbol = '▏',
    })
  end,
}
