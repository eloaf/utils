-- print("Lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- print("Lazy setup")
require("lazy").setup({
    "nvim-lua/plenary.nvim",
	{
		'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- or branch = '0.1.x'
	},
    {
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
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    },
	{
		-- Sometimes we need to run TSUpdate ourselves it seems, or `:TSInstall all` before as well
		-- https://github.com/LunarVim/LunarVim/issues/3680#issuecomment-1372559975
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	},
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
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
	},
	{
		"ray-x/lsp_signature.nvim",
	},
    {
        -- https://github.com/ryanoasis/vim-devicons/issues/198
        -- still problems with the line...
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
	"github/copilot.vim",
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
})
