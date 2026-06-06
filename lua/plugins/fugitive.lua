return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		-- Git status (interactive)
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },

		-- Commits
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gca", "<cmd>Git commit --amend<cr>", desc = "Git commit amend" },

		-- Push/Pull
		{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },

		-- Merge conflicts (3-way merge)
		{ "<leader>gm", "<cmd>Gdiffsplit!<cr>", desc = "3-way merge (conflicts)" },

		-- Diff and blame
		{ "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vertical split)" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },

		-- Helpers
		{ "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git add current file" },
		{ "<leader>gr", "<cmd>Gread<cr>", desc = "Git checkout current file" },
	},
}
