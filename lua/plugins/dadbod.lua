return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	keys = {
		{ "<leader>db", "<CMD>DBUIToggle<CR>", desc = "Toggle DBUI" },
		{ "<leader>da", "<CMD>DBUIAddConnection<CR>", desc = "Add DB connection" },
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_force_echo_notifications = 1
		vim.g.db_ui_win_position = "left"
		vim.g.db_ui_winwidth = 40

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				-- Execute query: visual selection or whole file
				vim.keymap.set("n", "<leader>sq", "<Plug>(DBUI_ExecuteQuery)", { buffer = true })
				vim.keymap.set("v", "<leader>sq", "<Plug>(DBUI_ExecuteQuery)", { buffer = true })
				-- Save query
				vim.keymap.set("n", "<leader>sw", "<Plug>(DBUI_SaveQuery)", { buffer = true })
			end,
		})
	end,
}
