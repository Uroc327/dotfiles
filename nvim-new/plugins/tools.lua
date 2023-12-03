return {
	-- TODO in case telescope undo doesn't to it use python: "simnalamburt/vim-mundo" + 'let g:mundo_preview_bottom = 1'

	{
		"AndrewRadev/linediff.vim",

		config = function()
			vim.g.linediff_buffer_type = "scratch"
			vim.g.linediff_first_buffer_command = "leftabove new"
			vim.g.linediff_second_buffer_command = "rightbelow vnew"
		end,
	},

	{
		"Pocco81/auto-save.nvim",
		config = true
	},

	{
		"folke/which-key.nvim",
		config = function(_, opts)
			which_key = require("which-key")
			which_key.setup(opts)
			which_key.register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 noet
