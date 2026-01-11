return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local fb_actions = require("telescope").extensions.file_browser.actions

		local select_and_cd = function(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			if entry and entry.Path and entry.Path:is_dir() then
				vim.fn.chdir(entry.Path:absolute())
			end
			actions.select_default(prompt_bufnr)
		end

		telescope.setup({
			pickers = {
				colorscheme = {
					color_devicons = true,
					enable_preview = true,
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					respect_gitignore = false,
					mappings = {
						["i"] = {
							["<Tab>"] = select_and_cd,
							["<CR>"] = select_and_cd,
							["<C-c>"] = actions.close,
							["<C-h>"] = fb_actions.goto_parent_dir,
							["<C-l>"] = fb_actions.change_cwd,
							["<C-n>"] = fb_actions.create,
							["<C-r>"] = fb_actions.rename,
							["<C-d>"] = fb_actions.remove,
							["<C-y>"] = fb_actions.copy,
							["<C-m>"] = fb_actions.move,
							["<C-.>"] = fb_actions.toggle_hidden,
						},
						["n"] = {
							["q"] = actions.close,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = actions.select_default,
							["c"] = fb_actions.change_cwd,
							["n"] = fb_actions.create,
							["r"] = fb_actions.rename,
							["d"] = fb_actions.remove,
							["y"] = fb_actions.copy,
							["m"] = fb_actions.move,
							["."] = fb_actions.toggle_hidden,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
}
