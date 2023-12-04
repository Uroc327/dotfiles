-- Autocompletion

-- Want:
-- <C-Space> or trigger for open compl list
-- <Enter> for selection from list
-- <C-Space> for info on list
-- <Tab> for tab completion (similar to shell. Tab should select the first best choice immediatly)
-- all similar to VSCode IntelliSense behavior

-- The nvim-cmp wiki has a couple examples as well

return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{ "hrsh7th/cmp-nvim-lsp", dependencies = { "neovim/nvim-lspconfig" } },
		"hrsh7th/cmp-path",
		"dcampos/nvim-snippy",
		"dcampos/cmp-snippy",
	},

	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("snippy").expand_snippet(args.body)
				end,
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_document_symbol" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "snippy" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- TODO supposedly one wants these capabilities be communicated to lsp server's setup()
		-- I'm not so sure though... Wouldn't that restrict their default config?
	end,
}
-- vim: ts=2 sts=2 sw=2 noet
