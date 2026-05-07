-- Keymaps
-- vim.keymap.set("n", "<leader>e", "<CMD>ViredOpen<CR>")
-- vim.keymap.set("n", "<leader>fp", "<CMD>ViredProjects<CR>")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>bk", "<CMD>bdelete<CR>", { desc = "Kill buffer" })
vim.keymap.set("n", "<leader>fm", ":Telescope man_pages<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope resume<CR>")
vim.keymap.set("n", "<leader>ft", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- LSP keymaps
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "grr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>D", ":Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]q", "<CMD>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "[q", "<CMD>cprev<CR>zz", { desc = "Prev quickfix" })


vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

vim.g.undotree_WindowLayout = 3

vim.cmd([[
  autocmd FileType undotree setlocal winwidth=52
]])
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
