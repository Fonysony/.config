local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = { 'html', 'cssls', 'tsserver', 'jsonls', 'eslint', 'rust_analyzer', 'clangd', 'csharp_ls', 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
   mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      -- ['<C-c>'] = cmp.mapping.abort(),
      ['<Return>'] = cmp.mapping.confirm(),
      ['<C-Space>'] = cmp.mapping.complete(),
   })
})

lsp_zero.on_attach(function(client, bufnr)
   local opts = { buffer = bufnr, remap = false }
   
   vim.keymap.set('n', 'gd', function() vim.lsp.buf.defintion() end, opts)
   vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
   vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workshop_symbol() end, opts)
   vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
   vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
   vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
end)

