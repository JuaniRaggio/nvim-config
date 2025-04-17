vim.g.mapleader = " "
vim.opt.shell = "/bin/zsh"
vim.opt.shellcmdflag = "-ic"

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
  colorscheme tokyonight
  highlight TermNormal guibg=NONE guifg=NONE
  highlight TermNormalNC guibg=NONE guifg=NONE
  highlight Normal guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE
  highlight StatusLine guibg=NONE
  highlight VertSplit guibg=NONE
  highlight LineNr       guifg=#93CEED gui=NONE
  highlight CursorLineNr guifg=#FFFFFF gui=bold
  highlight LineNrAbove  guifg=#93CEED gui=NONE
  highlight LineNrBelow  guifg=#93CEED gui=NONE
  highlight! link @type NONE
  highlight! link @variable NONE
]])
