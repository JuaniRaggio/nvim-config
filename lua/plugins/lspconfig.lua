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
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("tinymist", {
				capabilities = capabilities,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "never",
				},
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("ocamllsp", {
				capabilities = capabilities,
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})

			vim.lsp.config("solargraph", {
				capabilities = capabilities,
				settings = {
					solargraph = {
						diagnostics = true,
					},
				},
			})

			vim.lsp.config("gopls", {
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

			vim.lsp.config("elixirls", {
				capabilities = capabilities,
				settings = {
					elixirLS = {
						dialyzerEnabled = true,
						fetchDeps = false,
					},
				},
			})

			vim.lsp.config("korean_ls", {
				cmd = { "korean-ls", "--stdio" },
				filetypes = { "markdown", "org", "typst" },
				root_markers = { ".git" },
				capabilities = capabilities,
			})

			vim.lsp.config("sqls", {
				capabilities = capabilities,
				settings = {
					sqls = {
						lowercaseKeywords = false,
					},
				},
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
				},
			})

			vim.lsp.config("volar", {
				capabilities = capabilities,
				filetypes = { "vue" },
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			})

			vim.lsp.enable({ "tinymist", "lua_ls", "clangd", "ocamllsp", "pyright", "solargraph", "gopls", "elixirls", "korean_ls", "sqls", "ts_ls", "volar" })

			-- Desactivar el highlighting de semantic tokens del LSP: pisaba a
			-- treesitter y rompia el scheme (clangd colorea `auto` como el tipo
			-- deducido y los tipos custom como @lsp.type.class -> Type, ademas del
			-- parpadeo "se pinta y se apaga"). Con esto treesitter es la unica
			-- fuente de colores: auto -> @type.builtin (ambar), tipos custom ->
			-- @type (celeste), consistente y sin parpadeo.
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})
		end,
	},
}
