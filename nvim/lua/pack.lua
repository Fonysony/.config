-- AUTOMATICALLY INSTALL AND SETUP packer.nvim

local ensure_packer = function()
   local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
   if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd('packadd packer.nvim')
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'

	-- Treesitter
   use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
   
   -- ColorSchemes
   use 'Mofiqul/dracula.nvim'

   -- LSP
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         {'neovim/nvim-lspconfig'},
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'L3MON4D3/LuaSnip'},
      }
   }
   
   -- Debug Adapter Protocol
	use { 
      'mfussenegger/nvim-dap',
      ensure_installed = { '' }
   }
	use { 'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

	-- Autopair
	use 'windwp/nvim-autopairs'

   -- Godot
   use 'habamax/vim-godot'

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
      require('packer').sync()
   end
end)


