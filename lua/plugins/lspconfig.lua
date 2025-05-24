return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		require("lsp_signature").setup({
			bind = true,
			floating_window = true,
			hint_enable = true,
			hi_parameter = "Search",
		}),

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
				on_attach = function(client, bufnr)
					-- Opcional: Mapea comandos LSP para el buffer actual
					require("lsp_signature").on_attach({
						bind = true,
						floating_window = true,
						hint_enable = true,
					}, bufnr)
				end,
			})

			-- Pyright para Python
			lspconfig.pyright.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- solargraph para Ruby
			lspconfig.solargraph.setup({
				settings = {
					solargraph = {
						diagnostics = true,
					},
				},
			})

		end,
	},
}
