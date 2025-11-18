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

vim.cmd([[
  colorscheme kanagawa-wave
  highlight TermNormal   guibg=NONE guifg=NONE
  highlight TermNormalNC guibg=NONE guifg=NONE
  highlight Normal       guibg=NONE ctermbg=NONE
  highlight SignColumn   guibg=NONE
  highlight StatusLine   guibg=NONE
  highlight VertSplit    guibg=NONE
  highlight LineNr       guifg=#54546D gui=NONE
  highlight CursorLineNr guifg=#DCD7BA gui=bold
  highlight LineNrAbove  guifg=#7E9CD8 gui=NONE
  highlight LineNrBelow  guifg=#7E9CD8 gui=NONE
]])
