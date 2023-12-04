return {
	-- focused screen with large margins
	{
		"junegunn/goyo.vim",

		config = function()
			vim.g.goyo_width = 150

			vim.api.nvim_create_autocmd("User", {
				pattern = "GoyoEnter",
				nested = true,
				callback = function()
					vim.g.goyo_bak_colorscheme = vim.g.colors_name
					vim.g.goyo_bak_showmode = vim.o.showmode
					vim.g.goyo_bak_showcmd = vim.o.showcmd

					vim.cmd.colorscheme("seoul256")
					vim.o.wrap = true
					vim.o.showmode = false
					vim.o.showcmd = false
					vim.cmd("Limelight")
					require("lualine").hide()
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "GoyoLeave",
				nested = true,
				callback = function()
					require("lualine").hide({ unhide = true })
					vim.cmd("Limelight!")
					vim.o.wrap = false
					vim.o.showmode = vim.g.goyo_bak_showmode
					vim.o.showcmd = vim.g.goyo_bak_showcmd
					vim.cmd.colorscheme(vim.g.goyo_bak_colorscheme)
				end,
			})
		end,
	},

	-- grey out other paragraphs than current
	"junegunn/limelight.vim",

	{
		"junegunn/seoul256.vim",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					vim.cmd.colorscheme("seoul256")
				end,
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 noet
