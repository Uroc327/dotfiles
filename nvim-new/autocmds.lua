vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "sh", "bash", "zsh", "fstab" },
	callback = function()
		vim.cmd.runtime("ftplugin/man.vim")
	end,
})

-- Omitted from old vimrc, add back if needed
-- " quickfix on bottom
-- autocmd FileType qf wincmd J
-- " check if file has changed, when a split/window gains focus
-- autocmd FocusGained * :checktime
-- autocmd StdinReadPost * set buftype=nofile

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
	group = highlight_group,
	pattern = "*",
})

local numbertoggle_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	callback = function()
		if vim.o.number and vim.fn.mode() ~= "i" then
			vim.o.relativenumber = true
		end
	end,
	group = numbertoggle_group,
	pattern = "*",
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	callback = function()
		if vim.o.number then
			vim.o.relativenumber = false
		end
	end,
	group = numbertoggle_group,
	pattern = "*",
})

-- vim: ts=2 sts=2 sw=2 noet
