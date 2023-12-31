	-- print("Packer")
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  } 

  -- requires make and gcc; `brew install make gcc`
  -- fzf-native is a c port of fzf. It only covers the algorithm and implements few functions to support calculating the score.
  -- 
  -- This means that the fzf syntax is supported:
  -- 
  -- Token	Match type			Description
  -- sbtrkt	fuzzy-match			Items that match sbtrkt
  -- 'wild	exact-match (quoted)		Items that include wild
  -- ^music	prefix-exact-match		Items that start with music
  -- .mp3$	suffix-exact-match		Items that end with .mp3
  -- !fire	inverse-exact-match		Items that do not include fire
  -- !^music	inverse-prefix-exact-match	Items that do not start with music
  -- !.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3
  -- A single bar character term acts as an OR operator. For example, the following query matches entries that start with core and end with either go, rb, or py.
  -- 
  -- ^core go$ | rb$ | py$
  -- This is an advantage over the more simpler fzy algorithm, which is also available for telescope (as native component or as lua component).
  -- 

   use('nvim-telescope/telescope-fzf-native.nvim', {run = 'make'})

   -- Sometimes we need to run TSUpdate ourselves it seems, or `:TSInstall all` before as well
   -- https://github.com/LunarVim/LunarVim/issues/3680#issuecomment-1372559975
   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

   -- use('theprimeagen/harpoon')
   use {
	   "ThePrimeagen/harpoon",
	   branch = "harpoon2",
	   requires = { {"nvim-lua/plenary.nvim"} }
   }

   use "mbbill/undotree"

   use "tpope/vim-fugitive"

   use {
	   "williamboman/mason.nvim",
	   "williamboman/mason-lspconfig.nvim",
	   "neovim/nvim-lspconfig",
   }

   use {
	   'VonHeikemen/lsp-zero.nvim',
	   branch = 'v3.x',
	   requires = {
		   --- Uncomment these if you want to manage the language servers from neovim
		   -- {'williamboman/mason.nvim'},
		   -- {'williamboman/mason-lspconfig.nvim'},

		   -- LSP Support
		   {'neovim/nvim-lspconfig'},
		   -- Autocompletion
		   {'hrsh7th/nvim-cmp'},
		   {'hrsh7th/cmp-nvim-lsp'},
		   {'L3MON4D3/LuaSnip'},
	   }
   }

   use {
	   "ray-x/lsp_signature.nvim",
   }

   -- https://github.com/ryanoasis/vim-devicons/issues/198
   -- still problems with the line...
   use {
       'nvim-lualine/lualine.nvim',
       requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   }

   use "github/copilot.vim"
   -- https://github.com/neoclide/coc.nvim?tab=readme-ov-file
   -- use('neoclide/coc.nvim', {branch = 'release'})

  -- use({
  --	  'rose-pine/neovim',
  --	  as = 'rose-pine',
  --	  config = function()
  --		  vim.cmd("colorscheme rose-pine")
  --	  end
  --})
end)
