return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
      functions = { bold = true },
      variables = {},
    },
    on_highlights = function(hl, c)
      -- Hacer Telescope transparente
      hl.TelescopeNormal = { bg = "NONE" }
      hl.TelescopeBorder = { bg = "NONE" }
      hl.TelescopePromptNormal = { bg = "NONE" }
      hl.TelescopePromptBorder = { bg = "NONE" }
      hl.TelescopePromptTitle = { bg = "NONE" }
      hl.TelescopeResultsNormal = { bg = "NONE" }
      hl.TelescopeResultsBorder = { bg = "NONE" }
      hl.TelescopeResultsTitle = { bg = "NONE" }
      hl.TelescopePreviewNormal = { bg = "NONE" }
      hl.TelescopePreviewBorder = { bg = "NONE" }
      hl.TelescopePreviewTitle = { bg = "NONE" }

      -- Mantener la selección visible con un fondo sutil
      hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.fg }
      hl.TelescopeSelectionCaret = { bg = c.bg_highlight, fg = c.cyan }

      -- Esquema MINIMALISTA: la mayoria del codigo en color base, solo se
      -- resaltan funciones/tipos/keywords. Interno a tokyonight.
      local fg, subtle = c.fg, c.fg_gutter

      hl.Identifier = { fg = fg }
      hl.Variable = { fg = fg }
      hl.Operator = { fg = fg }
      hl.Delimiter = { fg = subtle }

      -- FUNCIONES: blue + bold (para ver flujo de ejecucion)
      hl.Function = { fg = c.blue, bold = true }
      hl["@function"] = { fg = c.blue, bold = true }
      hl["@function.call"] = { fg = c.blue, bold = true }
      hl["@method"] = { fg = c.blue, bold = true }
      hl["@method.call"] = { fg = c.blue, bold = true }

      -- KEYWORDS: green (sutil, sin bold)
      hl.Keyword = { fg = c.green }
      hl["@keyword"] = { fg = c.green }
      hl["@keyword.function"] = { fg = c.green }
      hl["@keyword.return"] = { fg = c.green }

      -- TIPOS: yellow + bold (para ver declaraciones)
      hl.Type = { fg = c.yellow, bold = true }
      hl["@type"] = { fg = c.yellow, bold = true }
      hl["@type.builtin"] = { fg = c.yellow, bold = true }

      -- STRINGS: cyan (sutil)
      hl.String = { fg = c.cyan }
      hl["@string"] = { fg = c.cyan }

      -- COMENTARIOS: gris + italic
      hl.Comment = { fg = c.comment, italic = true }
      hl["@comment"] = { fg = c.comment, italic = true }

      -- PUNTUACION: sutil
      hl["@punctuation"] = { fg = subtle }
      hl["@punctuation.bracket"] = { fg = subtle }
      hl["@punctuation.delimiter"] = { fg = subtle }
    end,
  },
}
