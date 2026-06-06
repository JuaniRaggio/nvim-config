return {
        "stevearc/oil.nvim",
        lazy = false,
        config = function()
                local oil = require("oil")

                -- Funcion para abrir archivos binarios con el visor del sistema
                local function open_with_system()
                        local entry = oil.get_cursor_entry()
                        if not entry or entry.type == "directory" then
                                -- Si es directorio, comportamiento normal
                                require("oil.actions").select.callback()
                                return
                        end

                        local dir = oil.get_current_dir()
                        if not dir then
                                return
                        end

                        local filepath = dir .. entry.name

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
                                                vim.fn.jobstart({ "open", filepath }, { detach = true })
                                                return
                                        end
                                end
                        end

                        -- Si no es binario, abrir normalmente en Neovim
                        require("oil.actions").select.callback()
                end

                oil.setup({
                        confirmation = {
                                border = "rounded",
                        },
                        columns = {
                                "permissions",
                                "size",
                                "mtime",
                                -- "icon",
                        },
                        view_options = {
                                show_hidden = true,
                        },
                        keymaps = {
                                ["<CR>"] = {
                                        callback = open_with_system,
                                        desc = "Open with system viewer for PDFs/images, or edit in nvim",
                                        mode = "n",
                                },
                        },
                })
        end,
}
