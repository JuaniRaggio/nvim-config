vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
-- Invertir j y k para movimiento
vim.api.nvim_set_keymap("n", "j", "k", opts)
vim.api.nvim_set_keymap("n", "k", "j", opts)
vim.api.nvim_set_keymap("v", "j", "k", opts)
vim.api.nvim_set_keymap("v", "k", "j", opts)

-- Hacer lo mismo para otras combinaciones como c (cortar) y y (copiar)
vim.api.nvim_set_keymap("n", "cj", "ck", opts)
vim.api.nvim_set_keymap("n", "ck", "cj", opts)

vim.api.nvim_set_keymap("n", "yj", "yk", opts)
vim.api.nvim_set_keymap("n", "yk", "yj", opts)

vim.keymap.set("n", "d", function()
    local key = vim.fn.getcharstr()
    local num = ""
    -- Capture the number of lines to delete
    while key:match("%d") do
        num = num .. key
        key = vim.fn.getcharstr()
    end
    -- Check the next key to determine direction
    if key == "j" then
        return "d" .. num .. "k"
    elseif key == "k" then
        return "d" .. num .. "j"
    else
        -- If the next key is not 'j' or 'k', return the original command
        return "d" .. num .. key
    end
end, { expr = true })

vim.api.nvim_set_keymap("n", "<leader>h", ":belowright 10split | terminal<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true, silent = true})
vim.keymap.set("v", "<C-u>", "<C-u>zz", {noremap = true, silent = true})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true, silent = true})
vim.keymap.set("v", "<C-d>", "<C-d>zz", {noremap = true, silent = true})


vim.env.JAVA_HOME = '/opt/homebrew/opt/openjdk@23'
vim.env.PATH = vim.env.JAVA_HOME .. '/bin:' .. vim.env.PATH

require("miconfignvim")
require("miconfignvim.lazy")

vim.cmd("colorscheme quiet")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight VertSplit guibg=NONE")

