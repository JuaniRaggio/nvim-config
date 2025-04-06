vim.g.mapleader = " "
vim.opt.shell = "/bin/zsh"
vim.opt.shellcmdflag = "-ic"

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
