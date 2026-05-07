return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		local select_and_cd = function(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			if entry and entry.Path and entry.Path:is_dir() then
				vim.fn.chdir(entry.Path:absolute())
			end
			actions.select_default(prompt_bufnr)
		end

		local ivy_opts = {
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 999,
				prompt_position = "top",
			},
			sorting_strategy = "ascending",
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		}

		telescope.setup({
			defaults = vim.tbl_extend("force", ivy_opts, {
				disable_devicons = true,
			}),
			pickers = {
				colorscheme = vim.tbl_extend("force", ivy_opts, {
					color_devicons = true,
					enable_preview = true,
				}),
				man_pages = {
					sections = { "ALL" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				file_browser = vim.tbl_extend("force", ivy_opts, {
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					respect_gitignore = false,
					mappings = {
						["i"] = {
							["<Tab>"] = select_and_cd,
							["<CR>"] = select_and_cd,
							["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-c>"] = actions.close,
						},
						["n"] = {
							["<Tab>"] = select_and_cd,
							["<CR>"] = select_and_cd,
							["q"] = actions.close,
							["l"] = actions.select_default,
						},
					},
				}),
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
	end,
}
