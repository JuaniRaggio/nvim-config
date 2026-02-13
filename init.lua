vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

vim.o.background = "dark"
-- vim.cmd("colorscheme solarized")
vim.cmd("colorscheme tokyonight-moon")

local function apply_custom_highlights()
  -- UI highlights
  vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "NONE", fg = "NONE" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#586e75" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#93a1a1", bold = true })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#657b83" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#657b83" })

  -- Treesitter minimal - desactivar grupos menos importantes
  vim.api.nvim_set_hl(0, "@variable", {})
  vim.api.nvim_set_hl(0, "@variable.builtin", {})
  vim.api.nvim_set_hl(0, "@variable.parameter", {})
  vim.api.nvim_set_hl(0, "@variable.member", {})
  vim.api.nvim_set_hl(0, "@property", {})
  vim.api.nvim_set_hl(0, "@field", {})
  vim.api.nvim_set_hl(0, "@parameter", {})
  vim.api.nvim_set_hl(0, "@punctuation", {})
  vim.api.nvim_set_hl(0, "@punctuation.bracket", {})
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", {})
  vim.api.nvim_set_hl(0, "@punctuation.special", {})
  vim.api.nvim_set_hl(0, "@operator", {})
  vim.api.nvim_set_hl(0, "@constructor", {})
  vim.api.nvim_set_hl(0, "@comment", {})
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_custom_highlights,
})
