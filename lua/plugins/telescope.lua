return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	cmd = "Telescope",
	keys = {
		-- File navigation
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
		{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume Last Picker" },

		-- Documentation
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },

		-- UI
		{ "<leader>th", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		-- Prevenir errores de mouse_click si no existe
		if not actions.mouse_click then
			actions.mouse_click = function() end
		end

		-- Abre archivos binarios (PDF, imagenes, videos) con el visor del sistema
		local open_with_system = function(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			if not entry then
				return
			end

			local filepath = entry.path or entry.filename
			if not filepath then
				return
			end

			-- Extensiones que se abren con el visor del sistema
			local system_open_extensions = {
				"pdf", "PDF",
				"png", "jpg", "jpeg", "gif", "bmp", "webp", "PNG", "JPG", "JPEG",
				"mp4", "mov", "avi", "mkv", "webm", "MP4", "MOV",
				"doc", "docx", "xls", "xlsx", "ppt", "pptx",
			}

			local extension = filepath:match("^.+%.(.+)$")
			local should_open_externally = false

			if extension then
				for _, ext in ipairs(system_open_extensions) do
					if extension == ext then
						should_open_externally = true
						break
					end
				end
			end

			if should_open_externally then
				actions.close(prompt_bufnr)
				vim.fn.jobstart({ "open", filepath }, { detach = true })
			else
				actions.select_default(prompt_bufnr)
			end
		end

		-- Para file_browser: abre con sistema si es binario, sino cd si es directorio
		local fb_open_with_system_or_cd = function(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			if not entry then
				return
			end

			local filepath = entry.path or entry.filename
			if not filepath then
				return
			end

			-- Si es directorio, hacer cd
			if entry.Path and entry.Path:is_dir() then
				vim.fn.chdir(entry.Path:absolute())
				actions.select_default(prompt_bufnr)
				return
			end

			-- Si es archivo binario, abrir con sistema
			local system_open_extensions = {
				"pdf", "PDF",
				"png", "jpg", "jpeg", "gif", "bmp", "webp", "PNG", "JPG", "JPEG",
				"mp4", "mov", "avi", "mkv", "webm", "MP4", "MOV",
				"doc", "docx", "xls", "xlsx", "ppt", "pptx",
			}

			local extension = filepath:match("^.+%.(.+)$")
			if extension then
				for _, ext in ipairs(system_open_extensions) do
					if extension == ext then
						actions.close(prompt_bufnr)
						vim.fn.jobstart({ "open", filepath }, { detach = true })
						return
					end
				end
			end

			-- Si es archivo normal, abrir en Neovim
			actions.select_default(prompt_bufnr)
		end

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
				-- Sin mappings globales - cada picker define los suyos
			}),
			pickers = {
				-- Pickers de archivos usan open_with_system
				find_files = {
					mappings = {
						i = { ["<CR>"] = open_with_system },
						n = { ["<CR>"] = open_with_system, ["l"] = open_with_system },
					},
				},
				live_grep = {
					mappings = {
						i = { ["<CR>"] = open_with_system },
						n = { ["<CR>"] = open_with_system, ["l"] = open_with_system },
					},
				},
				buffers = {
					mappings = {
						i = { ["<CR>"] = open_with_system },
						n = { ["<CR>"] = open_with_system, ["l"] = open_with_system },
					},
				},
				-- Resto de pickers usan comportamiento por defecto
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
					require("telescope.themes").get_dropdown({
					mappings = {
						i = {
							["<CR>"] = actions.select_default,
						},
						n = {
							["<CR>"] = actions.select_default,
							["l"] = actions.select_default,
						},
					},
				}),
				},
				file_browser = vim.tbl_extend("force", ivy_opts, {
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
					respect_gitignore = false,
					mappings = {
						["i"] = {
							["<Tab>"] = select_and_cd,
							["<CR>"] = fb_open_with_system_or_cd,
							["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-c>"] = actions.close,
						},
						["n"] = {
							["<Tab>"] = select_and_cd,
							["<CR>"] = fb_open_with_system_or_cd,
							["q"] = actions.close,
							["l"] = fb_open_with_system_or_cd,
						},
					},
				}),
			},
		})

		-- Load extensions with error handling
		pcall(telescope.load_extension, "file_browser")
		pcall(telescope.load_extension, "ui-select")
	end,
}
