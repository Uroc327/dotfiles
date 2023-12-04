-- Fuzzy Finder (files, lsp, etc)

-- TODO merge in config from currente denite, munod, vim-ripgrep (which I want as quickfix (to quickly jump back and forth) as well as as selection)
-- TODO check current features (telescope, undo, lsp, quickfix?, diagnostics, git)

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",

		-- Exentions
		"crispgm/telescope-heading.nvim",
		"debugloop/telescope-undo.nvim",
		"luc-tielen/telescope_hoogle",
		"nvim-telescope/telescope-bibtex.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"paopaol/telescope-git-diffs.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"sindrets/diffview.nvim",
			},
		},
	},

	keys = {
		{ "<F8>", "<cmd>Telescope undo<cr>", desc = "undo history" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>" },
		{ "<leader>?", require("telescope.builtin").oldfiles, desc = "[?] Find recently opened files" },
		{ "<F2>", require("telescope.builtin").buffers, desc = "[ ] Find existing buffers" },
		{
			"<leader><leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
				)
			end,
			desc = "[/] Fuzzily search in current buffer",
		},

		{ "<leader>gf", require("telescope.builtin").git_files, desc = "Search [G]it [F]iles" },
		{ "<leader>gc", require("telescope.builtin").git_commits, desc = "Search [G]it [C]ommits" },
		{ "<leader>gb", require("telescope.builtin").git_branches, desc = "Search [G]it [B]ranches" },

		{ "<leader>sf", require("telescope.builtin").find_files, desc = "[S]earch [F]iles" },
		{ "<leader>sh", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
		{ "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
		{ "<leader>sg", require("telescope.builtin").live_grep, desc = "[S]earch by [G]rep" },
		{ "<leader>sG", ":LiveGrepGitRoot<cr>", desc = "[S]earch by [G]rep on Git Root" },
		{ "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", require("telescope.builtin").resume, desc = "[S]earch [R]esume" },
	},

	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = false,
				},
			},
		},
		extensions = {
			file_browser = {
				hijack_netrw = true,
			},
			heading = {
				treesitter = true,
				picker_opts = {
					layout_config = { width = 0.8, preview_width = 0.5 },
					layout_strategy = "horizontal",
				},
			},
			undo = {
				diff_context_lines = 8,
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("bibtex")
		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
		telescope.load_extension("heading")
		telescope.load_extension("hoogle")
		telescope.load_extension("undo")

		vim.cmd.cabbrev("Rg", "Telescope live_grep")

		-- Function to find the git root directory based on the current buffer's path
		local function find_git_root()
			-- Use the current buffer's path as the starting point for the git search
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()
			-- If the buffer is not associated with a file, return nil
			if current_file == "" then
				current_dir = cwd
			else
				-- Extract the directory from the current file's path
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			-- Find the Git root directory from the current file's path
			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		-- Custom live_grep function to search in git root
		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end

		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
	end,
}

-- vim: ts=2 sts=2 sw=2 noet