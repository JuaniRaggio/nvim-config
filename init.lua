vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>h", ":rightbelow vnew | vertical resize 42 | terminal<CR>",
        { noremap = true, silent = true })

vim.cmd [[highlight TermNormal guibg=NONE guifg=NONE]]
vim.cmd [[highlight TermNormalNC guibg=NONE guifg=NONE]]

vim.api.nvim_set_keymap("n", "gd",
        "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true, silent = true})
vim.keymap.set("v", "<C-u>", "<C-u>zz", {noremap = true, silent = true})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true, silent = true})
vim.keymap.set("v", "<C-d>", "<C-d>zz", {noremap = true, silent = true})


vim.env.JAVA_HOME = '/opt/homebrew/opt/openjdk@23'
vim.env.PATH = vim.env.JAVA_HOME .. '/bin:' .. vim.env.PATH

require("miconfignvim")
require("miconfignvim.lazy")

vim.cmd("colorscheme tokyonight-night")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight VertSplit guibg=NONE")

