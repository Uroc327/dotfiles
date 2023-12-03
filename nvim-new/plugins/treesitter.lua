return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
	},

	keys = {
		{
			";",
			require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_next,
			mode = { "n", "x", "o" },
			desc = "Repat last treesitter move",
		},
		{
			",",
			require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_prev,
			mode = { "n", "x", "o" },
			desc = "Repat last treesitter move",
		},
		{
			"f",
			require("nvim-treesitter.textobjects.repeatable_move").builtin_f,
			mode = { "n", "x", "o" },
		},
		{
			"F",
			require("nvim-treesitter.textobjects.repeatable_move").builtin_F,
			mode = { "n", "x", "o" },
		},
	},

	opts = {
		ensure_installed = {
			"bash",
			"bibtex",
			"diff",
			"haskell",
			"julia",
			"latex",
			"lua",
			"make",
			"markdown",
			"matlab",
			"vim",
			"vimdoc",
			"yaml",
		},

		auto_install = false,

		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "<M-space>",
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["ac"] = "@comment.outer",
					["ic"] = "@comment.inner",
					["am"] = "@function.outer",
					["im"] = "@function.inner",
					["ao"] = "@loop.outer",
					["io"] = "@loop.inner",
					["at"] = "@class.outer",
					["it"] = "@class.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]]"] = "@class.outer",
					["]a"] = "@paramter.outer",
					--["]c"] = "@comment.outer", TODO find nice mapping (clashes with next change for vim diff view and next hunk from gitsigns)
					["]m"] = "@function.outer",
					["]o"] = "@loop.*",
				},
				goto_next_end = {
					["]["] = "@class.outer",
					["]A"] = "@paramter.outer",
					--["]C"] = "@comment.outer",
					["]M"] = "@function.outer",
				},
				goto_previous_start = {
					["[["] = "@class.outer",
					["[a"] = "@paramter.outer",
					--["[c"] = "@comment.outer",
					["[m"] = "@function.outer",
					["[o"] = "@loop.*",
				},
				goto_previous_end = {
					["[]"] = "@class.outer",
					["[A"] = "@paramter.outer",
					--["[C"] = "@comment.outer",
					["[M"] = "@function.outer",
				},
			},

			swap = {
				enable = true,
				swap_next = {
					[")a"] = "@parameter.inner",
				},
				swap_previous = {
					["(a"] = "@parameter.inner",
				},
			},
		},
	},

	config = function()
		vim.defer_fn(function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end, 0)
	end,

	build = ":TSUpdate",
}

-- vim: ts=2 sts=2 sw=2 noet
