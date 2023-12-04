return {
	"triglav/vim-visual-increment",

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
			vim.fn["camelcasemotion#CreateMotionMappings"]("<Leader>")
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 noet
