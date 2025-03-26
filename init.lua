vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ":rightbelow vnew | vertical resize 42 | terminal<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  opts
)

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("v", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

require("miconfignvim")
require("miconfignvim.lazy")

vim.cmd([[
  colorscheme tokyonight-night
  highlight TermNormal guibg=NONE guifg=NONE
  highlight TermNormalNC guibg=NONE guifg=NONE
  highlight Normal guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE
  highlight SignColumn guibg=NONE
  highlight StatusLine guibg=NONE
  highlight VertSplit guibg=NONE
  highlight! link @variable NONE
  highlight! link @type NONE
]])
