return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig.tinymist.setup({
				capabilities = capabilities,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "never",
				},
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Pyright para Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- solargraph para Ruby
			lspconfig.solargraph.setup({
				capabilities = capabilities,
				settings = {
					solargraph = {
						diagnostics = true,
					},
				},
			})

			-- gopls para Go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})
		end,
	},
}
