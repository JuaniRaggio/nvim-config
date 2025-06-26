vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Insane remap: copys on system buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Space+s replaces de word in which we are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- SPC + m + t -> Run Maven -> For running mvn tests
vim.keymap.set("n", "<leader>mt", [[:!mvn clean test<CR>]])

-- SPC + m + f -> Run Maven for JavaFX
vim.keymap.set("n", "<leader>mf", [[:!mvn clean javafx:run<CR>]])

-- Show explicitly compilation errors
vim.keymap.set("n", "<leader>?", [[:lua vim.diagnostic.open_float()<CR>]])
