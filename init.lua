vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

vim.o.background = "dark"
vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme solarized")
-- vim.cmd("colorscheme tokyonight-moon")

local function apply_custom_highlights()
  -- UI highlights
  vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6a5b" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d3c6aa", bold = true })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6a6a5b" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6a6a5b" })

  -- Comments con tono suave
  vim.api.nvim_set_hl(0, "@comment", { fg = "#6a6a5b", italic = true })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_custom_highlights,
})
