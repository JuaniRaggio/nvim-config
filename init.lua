vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

-- Usar ripgrep para :grep
vim.o.grepprg = "rg --vimgrep --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"

vim.o.background = "dark"
vim.cmd("colorscheme tokyonight-storm")

-- Aplicar highlights personalizados minimalistas
local function apply_minimal_colors()
  -- Colores Tokyo Night Storm
  local fg        = "#c0caf5"  -- foreground principal
  local comment   = "#565f89"  -- comentarios
  local blue      = "#7aa2f7"  -- funciones (marcan flujo)
  local cyan      = "#7dcfff"  -- strings
  local green     = "#9ece6a"  -- keywords
  local yellow    = "#e0af68"  -- tipos
  local subtle    = "#3b4261"  -- puntuacion, delimitadores

  -- MINIMALISTA: la mayoria del codigo en color base
  vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = fg })
  vim.api.nvim_set_hl(0, "Variable", { fg = fg })
  vim.api.nvim_set_hl(0, "Operator", { fg = fg })
  vim.api.nvim_set_hl(0, "Delimiter", { fg = subtle })

  -- FUNCIONES: blue + bold (para ver flujo de ejecucion)
  vim.api.nvim_set_hl(0, "Function", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@function", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@function.call", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@method", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@method.call", { fg = blue, bold = true })

  -- KEYWORDS: green (sin bold para que sea mas sutil)
  vim.api.nvim_set_hl(0, "Keyword", { fg = green })
  vim.api.nvim_set_hl(0, "@keyword", { fg = green })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = green })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = green })

  -- TIPOS: yellow + bold (para ver declaraciones)
  vim.api.nvim_set_hl(0, "Type", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "@type", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = yellow, bold = true })

  -- STRINGS: cyan (sutil)
  vim.api.nvim_set_hl(0, "String", { fg = cyan })
  vim.api.nvim_set_hl(0, "@string", { fg = cyan })

  -- COMENTARIOS: gris + italic
  vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = comment, italic = true })

  -- PUNTUACION: sutil
  vim.api.nvim_set_hl(0, "@punctuation", { fg = subtle })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = subtle })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = subtle })

  -- Numeros de linea
  vim.api.nvim_set_hl(0, "LineNr", { fg = comment })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = fg, bold = true })

  -- Fondo transparente
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })

  -- TELESCOPE: seleccion visible
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = fg, bg = "#292e42", bold = true })
  vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = yellow, bg = "#292e42", bold = true })
end

apply_minimal_colors()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_minimal_colors,
})

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
