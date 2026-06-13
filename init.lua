vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

-- Usar ripgrep para :grep
vim.o.grepprg = "rg --vimgrep --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"

vim.o.background = "dark"

-- Transparencia global: respetar SIEMPRE el fondo/opacidad de la terminal (iTerm),
-- sin importar el colorscheme. Limpia el bg (conservando fg) en cada cambio de tema.
local function enable_transparency()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "EndOfBuffer", "LineNr", "CursorLineNr",
    "StatusLine", "StatusLineNC", "VertSplit", "WinSeparator",
    "FoldColumn", "MsgArea",
  }
  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg = nil
    hl.ctermbg = nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = enable_transparency })

vim.cmd("colorscheme bathory")
enable_transparency()

-- Comentado: estos highlights son para everforest
-- local function apply_custom_highlights()
--   vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE", fg = "NONE" })
--   vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "NONE", fg = "NONE" })
--   vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
--   vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
--   vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
--   vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
--   vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6a5b" })
--   vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d3c6aa", bold = true })
--   vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6a6a5b" })
--   vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6a6a5b" })
--
--   -- Doxygen highlight groups
--   vim.api.nvim_set_hl(0, "DoxygenTag", { fg = "#e69875", bold = true })
--   vim.api.nvim_set_hl(0, "DoxygenParam", { fg = "#d3c6aa", bold = true })
--   vim.api.nvim_set_hl(0, "DoxygenBrief", { fg = "#a7c080", italic = true })
-- end
--
-- apply_custom_highlights()
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = apply_custom_highlights,
-- })

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
