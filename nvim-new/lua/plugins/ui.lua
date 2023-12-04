return {
	-- highlight word under cursor
	{
		"tzachar/local-highlight.nvim",
		opts = {
			hlgroup = "CursorColumn",
			insert_mode = true,
			disable_file_types = { "dummyfiletype" },
		},
	},

	-- smooth scrolling for certain, possibly long range movements
	{
		"karb94/neoscroll.nvim",
		opts = {
			--mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
			hide_cursor = false,
			respect_scrolloff = true,
			easing_function = "quadratic",
		},
		config = function(_, opts)
			-- defaults adapted from plugin source
			local t = {}
			--t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
			--t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
			--t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			--t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["zt"] = { "zt", { "50" } }
			t["zz"] = { "zz", { "50" } }
			t["zb"] = { "zb", { "50" } }
			--t["G"]  = { "G", { "100" } } 2023-12-04 these don't work yet
			--t["gg"] = { "gg", { "100" } }

			require("neoscroll").setup(opts)
			require("neoscroll.config").set_mappings(t)
		end
	},

	-- provide modal for vim.ui.input and telescope for vim.ui.select
	{
		"stevearc/dressing.nvim",
		config = true,
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			transparent = false,
			colors = {
				bg0 = "#262626",
			},
		},
		config = function(_, opts)
			require("onedark").setup(opts)
			vim.cmd.colorscheme("onedark")
			vim.api.nvim_set_hl(0, '@text.note', { link = 'Todo' })
			vim.api.nvim_set_hl(0, '@text.warning', { link = 'Todo' })
			vim.api.nvim_set_hl(0, '@text.danger', { link = 'Todo' })
		end,
	},

	-- TODO
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
		--		icons_enabled = false,
		--		component_separators = { left = "|", right = "|" },
				component_separators = "",
		--		section_separators = "",
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
					"location",
				},
				lualine_x = { "encoding", "fileformat", "filetype" }, -- TODO tab/space indent warning
				lualine_y = { "progress" },
				lualine_z = { "filesize" },
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
		opts = {
			indent = {
				char = "▎",
				tab_char = "▎",
			}
		},
	},
}
-- vim: ts=2 sts=2 sw=2 noet
