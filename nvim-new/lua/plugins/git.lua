return {
	-- if neogit doesn't work for me: "tpope/vim-fugitive",
	{
		"NeogitOrg/neogit",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
		},

		config = true,
	},

	-- git integration for buffers
	{
		"lewis6991/gitsigns.nvim",

		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects", -- for repeatable movement
		},

		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				local next_hunk_repeat, prev_hunk_repeat =
					require("nvim-treesitter.textobjects.repeatable_move").make_repeatable_move_pair(
						gs.next_hunk,
						gs.prev_hunk
					)
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						next_hunk_repeat()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						prev_hunk_repeat()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

				-- Actions from readme
				--map('n', '<leader>hs', gs.stage_hunk)
				--map('n', '<leader>hr', gs.reset_hunk)
				--map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				--map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				--map('n', '<leader>hS', gs.stage_buffer)
				--map('n', '<leader>hu', gs.undo_stage_hunk)
				--map('n', '<leader>hR', gs.reset_buffer)
				--map('n', '<leader>hp', gs.preview_hunk)
				--map('n', '<leader>hb', function() gs.blame_line{full=true} end)
				--map('n', '<leader>tb', gs.toggle_current_line_blame)
				--map('n', '<leader>hd', gs.diffthis)
				--map('n', '<leader>hD', function() gs.diffthis('~') end)
				--map('n', '<leader>td', gs.toggle_deleted)
			end,
		},
	},
}

-- vim: ts=2 sts=2 sw=2 noet
