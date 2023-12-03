return {
	-- highlight word under cursor
	{
		"tzachar/local-highlight.nvim",
		opts = {
			hlgroup = "CursorColumn",
			insert_mode = true,
		},
	},

	-- smooth scrolling for certain, possibly long range movements
	{
		"karb94/neoscroll.nvim",
		opts = {
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
			hide_cursor = false,
			respect_scrolloff = true,
			easing_function = "quadratic",
		},
	},

	-- provide modal for vim.ui.input and telescope for vim.ui.select
	{
		"stevearc/dressing.nvim",
		config = true,
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				theme = "onedark",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
					},
				},
				lualine_c = {
					{
						"filename",
						newfile_status = true,
						path = 1,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" }, -- TODO tab/space indent warning
				ulaline_y = { "progress" }, -- TODO searchcount, selectioncound
				lualine_z = { "location", "filesize" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		},
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = true,
	},
}
-- vim: ts=2 sts=2 sw=2 noet
