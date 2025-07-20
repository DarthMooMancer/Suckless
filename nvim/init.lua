local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.mouse =  ""
vim.opt.completeopt = "noselect"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.swapfile = false

vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>ff", "gg=G")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set('n', '<leader><leader>', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>h', ":Telescope help_tags<CR>")

require("lazy").setup("darthmoomancer.plugins")
require("everforest").setup({ transparent_background_level = 1 })
vim.cmd.colorscheme('everforest')

vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

