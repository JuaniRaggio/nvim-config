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
    end,
  },
}
