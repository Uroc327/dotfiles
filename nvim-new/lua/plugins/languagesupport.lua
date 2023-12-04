-- LSP Configuration & Plugins

-- Could add something like lspsaga.nvim (for nice boxes, markdown highting in hover, outline, breadcrumbs, and much more
-- But I'm not sure how mature this plugin is.

return {
	"JuliaEditorSupport/julia-vim",

	-- unused and thus untested
	--{
	--	"neomake/neomake",
	--	keys = {
	--		{ "<F5>", "<Cmd>Neomake!<CR>" },
	--	},
	--	config = function()
	--		vim.g.neomake_open_list = 2
	--	end,
	--},

	-- not worth the python provider.. replace with general repl plugin, running matlab in :term, and resorting to matlab lsp
	--{
	--	"daeyun/vim-matlab",
	--	config = function()
	--		vim.g.matlab_auto_mappings = 0
	--	end,
	--},

	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/projects/obsidian/Tutti/**",
			"BufNewFile " .. vim.fn.expand("~") .. "/projects/obsidian/Tutti/**",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			disable_frontmatter = true,
			workspaces = {
				{
					name = "Tutti",
					path = "~/projects/obsidian/Tutti",
				},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- status updates for LSP
			{ "j-hui/fidget.nvim", config = true },

			-- neovim init.lua lsp server
			{ "folke/neodev.nvim", config = true },

			{
				"mrcjkb/haskell-tools.nvim",
				version = "^3",
				ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
				config = function()
					vim.g.haskell_tools = {
						tools = {
							codeLens = { autoRefresh = true, },
							hoogle = { mode = "telescope-local", },
							hover = { enable = true, },
							definition = { hoogle_signature_fallback = true, },
						},

						hls = {
							auto_attach = true,
						},
					}
				end,
			},
		},

		config = function()
			local lspconfig = require("lspconfig")

			-- gather capabilities
			lspconfig.julials.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.matlab_ls.setup({})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					-- TODO check which of these telescope-provided actually yield a benefit over using the vanilla vim.ui version
					local tlscp = require("telescope.builtin")

					-- Jump to stuff
					nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					nmap("gd", tlscp.lsp_definitions, "[G]oto [D]efinition")
					nmap("gi", tlscp.lsp_implementations, "[G]oto [I]mplementation")
					nmap("gr", tlscp.lsp_references, "[G]oto [R]eferences")
					nmap("<leader>D", tlscp.lsp_type_definitions, "Type [D]efinition")

					nmap("<leader>i", tlscp.lsp_incoming_calls, "[I]ncoming Calls")
					nmap("<leader>o", tlscp.lsp_outgoing_calls, "[O]outgoing Calls")

					-- Find identifies
					nmap("<leader>ds", tlscp.lsp_document_symbols, "[D]ocument [S]ymbols")
					nmap("<leader>ss", tlscp.lsp_dynamic_workspace_symbols, "[S]earh Workspace [S]ymbols")

					-- map K even if 'keywordprg' isn't set
					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

					-- Refactor
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					vim.keymap.set(
						"v",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "LSP: [C]ode [A]ction" }
					)

					--nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					--nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					--nmap("<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "[W]orkspace [L]ist Folders")

					nmap("<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, "[F]ormat Buffer")
				end,
			})
		end,
	},

	-- filetype and syntax files
	"gentoo/gentoo-syntax",
	"tpope/vim-git",
	"xuhdev/tex-breqn.vim",
	"yinflying/matlab.vim",
}

-- vim: ts=2 sts=2 sw=2 noet
