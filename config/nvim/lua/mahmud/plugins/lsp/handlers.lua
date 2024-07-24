local M = {}

local icons = require('mahmud.utils.icons')

local signs = {
  { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
  { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warn },
  { name = 'DiagnosticSignInfo', text = icons.diagnostics.Info },
  { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
}

M.setup = function()
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end
end

M.lsp_keymaps = function(bufnr)
  -- builtins
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, buffer = bufnr, desc = 'Go To Declaration' })

  -- telescope
  vim.keymap.set('n', 'gR', function()
    require('mahmud.plugins.telescope').lsp_references()
  end, { silent = true, buffer = bufnr, desc = 'Show References' })
  vim.keymap.set('n', 'gd', function()
    require('mahmud.plugins.telescope').lsp_definitions()
  end, { silent = true, buffer = bufnr, desc = 'View Definitions' })
  vim.keymap.set('n', '<leader>gr', M.rename, { expr = true, desc = 'Rename' })
  vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { silent = true, buffer = bufnr, desc = 'Code Action' })
  vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, buffer = bufnr, desc = 'Hover Symbol' })
  vim.keymap.set(
    'n',
    '<leader>K',
    vim.lsp.buf.signature_help,
    { silent = true, buffer = bufnr, desc = 'Signature Help' }
  )
  vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { silent = true, buffer = bufnr, desc = 'Show Diagnostic' })
  vim.keymap.set('n', ']d', M.diagnostic_goto(true), { silent = true, buffer = bufnr, desc = 'Next Diagnostic' })
  vim.keymap.set('n', '[d', M.diagnostic_goto(false), { silent = true, buffer = bufnr, desc = 'Previous Diagnostic' })
  vim.keymap.set(
    'n',
    '[e',
    M.diagnostic_goto(true, vim.diagnostic.severity.ERROR),
    { silent = true, buffer = bufnr, desc = 'Next Error' }
  )
  vim.keymap.set(
    'n',
    ']e',
    M.diagnostic_goto(false, vim.diagnostic.severity.ERROR),
    { silent = true, buffer = bufnr, desc = 'Previous Error' }
  )
end

function M.rename()
  if pcall(require, 'inc_rename') then
    return ':IncRename ' .. vim.fn.expand('<cword>')
  else
    vim.lsp.buf.rename()
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

M.on_attach = function(client, bufnr)
  if client.name == 'lua_ls' then
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end

  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI', 'InsertLeave' }, {
      pattern = '<buffer>',
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      group = vim.api.nvim_create_augroup('LSPCodeLens', { clear = true }),
    })
    vim.keymap.set(
      'n',
      '<leader>gl',
      '<cmd>lua vim.lsp.codelens.run()<CR>',
      { silent = true, buffer = bufnr, desc = 'Codelens' }
    )
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }
  vim.diagnostic.config(config)

  M.lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- M.capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities.textDocument.completion.completionItem.preselectSupport = true
-- M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- M.capabilities.textDocument.completion.completionItem.resolveSupport =
--   { properties = { 'documentation', 'detail', 'additionalTextEdits' } }
-- M.capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

return M
