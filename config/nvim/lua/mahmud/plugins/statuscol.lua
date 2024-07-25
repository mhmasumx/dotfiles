return {
  'luukvbaal/statuscol.nvim',
  event = 'BufReadPre',
  enabled = true,
  config = function()
    local builtin = require('statuscol.builtin')
    require('statuscol').setup({
      relculright = true,
      setopt = true,
      segments = {
        {
          sign = { name = { 'Diagnostic' }, maxwidth = 2, auto = true },
          click = 'v:lua.ScSa',
        },
        {
          sign = { name = { 'Play' }, maxwidth = 1, auto = true },
          click = 'v:lua.ScSa',
        },
        {
          text = { builtin.lnumfunc, ' ' },
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScLa',
        },
        -- { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        {
          sign = {
            name = { '.*' },
            text = { '%s' },
            namespace = { 'git.*' },
            maxwidth = 2,
            colwidth = 2,
            auto = true,
            wrap = false,
          },
          click = 'v:lua.ScSa',
        },
      },
      clickhandlers = {
        Play = function(args)
          if args.button == 'l' then
            if vim.bo.modified then
              vim.cmd('w')
            end
            print('Running the program')
            -- vim.cmd('CleanCompile')
            vim.cmd('Play')
          end
        end,
      },
    })
  end,
}
