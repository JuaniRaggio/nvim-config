-- Keymaps
vim.keymap.set("n", "<leader>ts", ":Neotree filesystem reveal left toggle<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})


vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", "<leader>/", ":CommentToggle<CR>")

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

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
    harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
    harpoon:list():next()
end)

