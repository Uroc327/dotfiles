return {
	-- auto-close parens
	"cohama/lexima.vim",

	-- useful textobjects (TODO check compatibility with treesitter)
	"wellle/targets.vim",

	-- something vim-surround / vim-sandwhich
	-- something sneak.vim

	-- Text Objects, Movements, and Basic Editing
	{
		"bkad/CamelCaseMotion",
		config = function()
			vim.call("camelcasemotion#CreateMotionMappings", "<Leader>")
		end,
	},

	{
		"triglav/vim-visual-increment",
		keys = {
			{ "<C-a>", "<Plug>VisualIncrement <Bar> gv", mode = "v" },
			{ "<C-x>", "<Plug>VisualDecrement <Bar> gv", mode = "v" },
		},
	},
}

-- vim: ts=2 sts=2 sw=2 noet
