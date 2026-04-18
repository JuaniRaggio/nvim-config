vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

vim.o.background = "dark"
vim.cmd("colorscheme everforest")

local function apply_custom_highlights()
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

  -- Doxygen highlight groups
  vim.api.nvim_set_hl(0, "DoxygenTag", { fg = "#e69875", bold = true })
  vim.api.nvim_set_hl(0, "DoxygenParam", { fg = "#d3c6aa", bold = true })
  vim.api.nvim_set_hl(0, "DoxygenBrief", { fg = "#a7c080", italic = true })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_custom_highlights,
})

-- Doc comments: resaltar tags y parametros via matchadd
-- C/C++/Java/Vue: estilo Doxygen/JSDoc (@param, @return, etc.)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "java", "vue", "javascript", "typescript" },
  callback = function()
    vim.fn.matchadd("DoxygenTag", [[@\w\+]])
    vim.fn.matchadd("DoxygenParam", [[@param\s\+\zs\w\+]])
    vim.fn.matchadd("DoxygenBrief", [[@brief\s\+\zs.*]])
  end,
})
-- Python: estilo Sphinx (:param:, :return:, :type:) y Google (Args:, Returns:)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.fn.matchadd("DoxygenTag", [[:\w\+\s\w\+:]])
    vim.fn.matchadd("DoxygenTag", [[:\w\+:]])
    vim.fn.matchadd("DoxygenParam", [[:\(param\|type\)\s\+\zs\w\+]])
    vim.fn.matchadd("DoxygenBrief", [[\(Args\|Returns\|Raises\|Yields\|Attributes\|Note\|Example\|Todo\):]])
  end,
})
