-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }
   use 'Mofiqul/dracula.nvim'
   vim.cmd[[colorscheme dracula]]

   use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
   use('nvim-treesitter/playground')
   use('mbbill/undotree')
   use('tpope/vim-fugitive')

   -- LSP-zero
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
         --- Uncomment these if you want to manage LSP servers from neovim
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- LSP Support
         {'neovim/nvim-lspconfig'},
         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'L3MON4D3/LuaSnip'},
      }
   }

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
      ensure_installed = {'tsserver', 'rust_analyzer'},
      handlers = {
         lsp_zero.default_setup,
      },
   })

   use {
      "windwp/nvim-autopairs",
   }
   require('nvim-autopairs').setup({
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = true,  -- disable when recording or executing a macro
      disable_in_visualblock = false, -- disable when insert after visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,  -- add bracket pairs after quote
      enable_check_bracket_line = true,  --- check bracket in same line
      enable_bracket_in_quote = true, --
      enable_abbr = false, -- trigger abbreviation
      break_undo = true, -- switch for basic rule break undo sequence
      check_ts = false,
      map_cr = true,
      map_bs = true,  -- map the <BS> key
      map_c_h = false,  -- Map the <C-h> key to delete a pair
      map_c_w = false, -- map <c-w> to delete a pair if possible
   })
end)
