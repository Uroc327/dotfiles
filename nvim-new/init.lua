-- TODO
-- - read help files of nvim-treesitter, which-key, julia-vim, obsidian.nvim, nvim-lspconfig, neoscroll.nvim, local-highlight.nvim, dressing.nvim, lualine.nvim, indent-blankline.nvim
-- - read and configure telescope (merge desired behavior with current denite/mundo settings)
-- - read and configure cmp
-- - read and configure neogit/gitsigns (I guess all the staging can be done with either...)

-- TODO Notes and ideas:
-- - star search for visual block
-- - shift star search for regex-or addition
-- - tagbar/outline (using denite? using language server? using treesitter) :h gO
-- - jump to definition, declaration, references, imlementation
-- - when showing undo tree, dim all non-related buffers
-- - toggling relative numbers per buffer
-- - autoformat on save using conform.nvim, lsp, or https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/autoformat.lua
-- - funny programs: adamtabrams/flatnvim, I60R/page, carlocab/tmux-nvr

-- This must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

require("lazy").setup("plugins", {
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				-- "matchit", extended % jumping -> treesitter?
				-- "matchparen", highlight parenthesis -> treesitter?
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"spellfile_plugin",
				"tutor",
				"vimball",
				"vimballPlugin",
			},
		},
	},
})

require("options")
require("keymaps")
require("autocmds")

-- vim: ts=2 sts=2 sw=2 noet
