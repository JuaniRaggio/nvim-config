vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

vim.o.background = "light"
vim.cmd("colorscheme rose-pine-dawn")
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme solarized")
-- vim.cmd("colorscheme tokyonight-moon")

local function apply_custom_highlights()
  -- Transparency (para que se vea el fondo de ghostty)
  vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_custom_highlights,
})
