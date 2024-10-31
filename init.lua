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

vim.api.nvim_set_keymap("n", "<leader>h", ":terminal<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.keymap.set("n", "<C-n>", "<C-d>")
vim.keymap.set("v", "<C-n>", "<C-d>")

require("miconfignvim")
require("miconfignvim.lazy")

vim.cmd("colorscheme tokyonight-moon")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight VertSplit guibg=NONE")


-- vim.cmd("highlight Normal guibg=#1b1f32")
-- vim.cmd("highlight LineNr guibg=#1b1f32")
-- vim.cmd("highlight SignColumn guibg=#1b1f32")
--
-- -- Cambia el color de la línea de comandos
-- vim.cmd("highlight Cmdline guifg=#ffffff guibg=#1b1f32")
--
-- -- Cambia el color de la barra de estado
-- vim.cmd("highlight StatusLine guifg=#ffffff guibg=#1b1f32")
-- vim.cmd("highlight StatusLineNC guifg=#888888 guibg=#1b1f32")
