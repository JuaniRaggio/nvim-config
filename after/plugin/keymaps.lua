-- File explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")

-- Buffer management
vim.keymap.set("n", "<leader>bk", "<CMD>bdelete<CR>", { desc = "Kill buffer" })

-- Formatting
vim.keymap.set("n", "<leader>ft", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- LSP keymaps (native, fast jumps)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Show References" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
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
