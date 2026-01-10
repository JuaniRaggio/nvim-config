vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  opts
)

require("miconfignvim")
require("miconfignvim.lazy")

vim.o.background = "dark"
vim.cmd("colorscheme solarized")

vim.cmd([[
  highlight TermNormal   guibg=NONE guifg=NONE
  highlight TermNormalNC guibg=NONE guifg=NONE
  highlight Normal       guibg=NONE ctermbg=NONE
  highlight SignColumn   guibg=NONE
  highlight StatusLine   guibg=NONE
  highlight VertSplit    guibg=NONE
  highlight LineNr       guifg=#586e75 gui=NONE
  highlight CursorLineNr guifg=#93a1a1 gui=bold
  highlight LineNrAbove  guifg=#657b83 gui=NONE
  highlight LineNrBelow  guifg=#657b83 gui=NONE
]])
