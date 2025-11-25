-- Keymaps
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>/", ":Telescope live_grep theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>fe", ":Telescope diagnostics theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches theme=get_ivy<CR>")
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})

vim.keymap.set("n", "<leader>#", ":CommentToggle<CR>")
vim.keymap.set("v", "<leader>#", ":CommentToggle<CR>")

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

vim.g.undotree_WindowLayout = 3

vim.cmd([[
  autocmd FileType undotree setlocal winwidth=52
]])
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
	harpoon:list():select(5)
end)
