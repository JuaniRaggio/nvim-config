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
				root_markers = { ".sqls.yaml", ".git" },
				settings = {
					sqls = {
						connections = {
							-- Configura conexiones aca o en .sqls.yaml en la raiz del proyecto
							-- {
							-- 	driver = "postgresql",
							-- 	dataSourceName = "host=localhost port=5432 user=postgres password=postgres dbname=mydb sslmode=disable",
							-- },
							-- {
							-- 	driver = "mysql",
							-- 	dataSourceName = "root:root@tcp(127.0.0.1:3306)/mydb",
							-- },
							-- {
							-- 	driver = "sqlite3",
							-- 	dataSourceName = "/path/to/db.sqlite3",
							-- },
						},
					},
				},
			})

			vim.lsp.enable({ "tinymist", "lua_ls", "clangd", "pyright", "solargraph", "gopls", "elixirls", "korean_ls", "sqls" })
		end,
	},
}
