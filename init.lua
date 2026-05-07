vim.g.mapleader = " "

require("miconfignvim")
require("miconfignvim.lazy")

-- Usar ripgrep para :grep
vim.o.grepprg = "rg --vimgrep --smart-case"
vim.o.grepformat = "%f:%l:%c:%m"

vim.o.background = "dark"
vim.cmd("colorscheme solarized")

-- Aplicar highlights personalizados
local function apply_minimal_colors()
  -- Colores solarized
  local base03  = "#002b36"
  local base02  = "#073642"
  local base01  = "#586e75"
  local base00  = "#657b83"
  local base0   = "#839496"
  local base1   = "#93a1a1"  -- casi blanco
  local base2   = "#eee8d5"
  local base3   = "#fdf6e3"
  local yellow  = "#b58900"
  local orange  = "#cb4b16"
  local red     = "#dc322f"
  local magenta = "#d33682"
  local violet  = "#6c71c4"
  local blue    = "#268bd2"
  local cyan    = "#2aa198"
  local green   = "#859900"

  -- SOLARIZED FIEL: colores segun especificacion oficial
  vim.api.nvim_set_hl(0, "Normal", { fg = base0, bg = "NONE" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = base0 })
  vim.api.nvim_set_hl(0, "Variable", { fg = base0 })

  -- Tipos: yellow + bold (para ver declaraciones rapido)
  vim.api.nvim_set_hl(0, "Type", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "Structure", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "Typedef", { fg = yellow, bold = true })

  -- Constantes: orange (solarized oficial)
  vim.api.nvim_set_hl(0, "Constant", { fg = orange })

  -- Numeros: cyan (solarized oficial)
  vim.api.nvim_set_hl(0, "Number", { fg = cyan })
  vim.api.nvim_set_hl(0, "Float", { fg = cyan })
  vim.api.nvim_set_hl(0, "Boolean", { fg = cyan })

  -- Operadores y delimitadores: base0
  vim.api.nvim_set_hl(0, "Operator", { fg = base0 })
  vim.api.nvim_set_hl(0, "Delimiter", { fg = base00 })

  -- Macros y preprocessor: orange (solarized oficial)
  vim.api.nvim_set_hl(0, "Macro", { fg = orange })
  vim.api.nvim_set_hl(0, "PreProc", { fg = orange })
  vim.api.nvim_set_hl(0, "PreCondit", { fg = orange })
  vim.api.nvim_set_hl(0, "Define", { fg = orange })

  -- Especiales: red (solarized oficial)
  vim.api.nvim_set_hl(0, "Special", { fg = red })
  vim.api.nvim_set_hl(0, "SpecialChar", { fg = red })
  vim.api.nvim_set_hl(0, "Tag", { fg = violet })
  vim.api.nvim_set_hl(0, "Label", { fg = base0 })

  -- TreeSitter: solarized fiel
  vim.api.nvim_set_hl(0, "@variable", { fg = base0 })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = base0 })
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = base0, italic = true })  -- parametros en italic
  vim.api.nvim_set_hl(0, "@variable.member", { fg = base0 })

  -- Tipos: yellow + bold (para ver declaraciones rapido)
  vim.api.nvim_set_hl(0, "@type", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "@type.definition", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "@namespace", { fg = yellow, bold = true })

  -- Constantes: orange (solarized)
  vim.api.nvim_set_hl(0, "@constant", { fg = orange })
  vim.api.nvim_set_hl(0, "@constant.builtin", { fg = orange })

  -- Numeros: cyan (solarized)
  vim.api.nvim_set_hl(0, "@number", { fg = cyan })
  vim.api.nvim_set_hl(0, "@number.float", { fg = cyan })
  vim.api.nvim_set_hl(0, "@boolean", { fg = cyan })

  -- Operadores: base0
  vim.api.nvim_set_hl(0, "@operator", { fg = base0 })

  -- Properties y fields: base0
  vim.api.nvim_set_hl(0, "@property", { fg = base0 })
  vim.api.nvim_set_hl(0, "@field", { fg = base0 })
  vim.api.nvim_set_hl(0, "@parameter", { fg = base0, italic = true })  -- parametros en italic

  -- Puntuacion: base00
  vim.api.nvim_set_hl(0, "@punctuation", { fg = base00 })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = base00 })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = base00 })
  vim.api.nvim_set_hl(0, "@punctuation.special", { fg = base00 })

  -- Tags: violet (solarized)
  vim.api.nvim_set_hl(0, "@tag", { fg = violet })
  vim.api.nvim_set_hl(0, "@tag.attribute", { fg = base0 })
  vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = base00 })

  -- Labels: base0
  vim.api.nvim_set_hl(0, "@label", { fg = base0 })

  -- KEYWORDS: green + bold (sin italic)
  vim.api.nvim_set_hl(0, "Keyword", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "Conditional", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "Repeat", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "Statement", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "Include", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "Exception", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = green, bold = true })

  -- TreeSitter keywords
  vim.api.nvim_set_hl(0, "@keyword", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.operator", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.import", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@keyword.exception", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@conditional", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@repeat", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@include", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@exception", { fg = green, bold = true })
  vim.api.nvim_set_hl(0, "@storageclass", { fg = green, bold = true })

  -- FUNCIONES: blue + bold (MARCAN FLUJO)
  vim.api.nvim_set_hl(0, "Function", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@function", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@function.call", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@method", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@method.call", { fg = blue, bold = true })
  vim.api.nvim_set_hl(0, "@constructor", { fg = blue, bold = true })

  -- STRINGS: cyan (solarized oficial)
  vim.api.nvim_set_hl(0, "String", { fg = cyan })
  vim.api.nvim_set_hl(0, "Character", { fg = cyan })
  vim.api.nvim_set_hl(0, "@string", { fg = cyan })
  vim.api.nvim_set_hl(0, "@string.escape", { fg = red })  -- escapes en red (solarized)
  vim.api.nvim_set_hl(0, "@string.regex", { fg = cyan })
  vim.api.nvim_set_hl(0, "@character", { fg = cyan })

  -- COMENTARIOS: gris oscuro + italic
  vim.api.nvim_set_hl(0, "Comment", { fg = base01, italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = base01, italic = true })

  -- DOXYGEN: destacar
  vim.api.nvim_set_hl(0, "DoxygenTag", { fg = orange, bold = true })
  vim.api.nvim_set_hl(0, "DoxygenParam", { fg = yellow, bold = true })
  vim.api.nvim_set_hl(0, "DoxygenBrief", { fg = green, italic = true })

  -- Numeros de linea
  vim.api.nvim_set_hl(0, "LineNr", { fg = base01 })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = base1, bold = true })

  -- Fondo transparente
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })

  -- TELESCOPE: mejorar contraste de seleccion
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = base2, bg = base02, bold = true })
  vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = yellow, bg = base02, bold = true })
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
