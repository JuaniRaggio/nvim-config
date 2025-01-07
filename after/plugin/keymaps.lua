require("neo-tree").setup({
	window = {
		width = "100%",
		height = "100%",
		position = "float",
	},
})
-- Keymaps
vim.keymap.set("n", "<leader>pv", ":Neotree filesystem reveal toggle<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})

vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", "<leader>/", ":CommentToggle<CR>")

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

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-j>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-k>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(5)
end)
vim.keymap.set("n", "<C-m>", function()
	harpoon:list():select(6)
end)
vim.keymap.set("n", "<C-,>", function()
	harpoon:list():select(7)
end)
vim.keymap.set("n", "<C-.>", function()
	harpoon:list():select(8)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
