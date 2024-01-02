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

vim.o.tabstop = 2 
vim.o.shiftwidth = 2
vim.o.number = true

require("lazy").setup({
	{
		"rose-pine/neovim",
		config = function()
			vim.cmd([[colorscheme rose-pine]])
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		"elihunter173/dirbuf.nvim",
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			vim.keymap.set("n", "ff", ":Telescope find_files<cr>")
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			vim.cmd([[TSUpdate]])
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "c","cpp","javascript", "lua", "vim", "vimdoc", "query" },

				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end
	},
	{
		"sitiom/nvim-numbertoggle"
	},
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = { theme = 'rose-pine' }
	}

})

vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>e", ":Dirbuf<CR>");
