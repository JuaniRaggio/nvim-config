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
  config = function(_, opts)
    require("tokyonight").setup(opts)
    -- Esquema minimalista (scopeado a tokyonight, no toca otros temas)
    require("miconfignvim.minimal").setup("tokyonight*", {
      fg      = "#c0caf5",
      comment = "#565f89",
      blue    = "#7aa2f7",
      cyan    = "#7dcfff",
      green   = "#9ece6a",
      yellow  = "#e0af68",
      subtle  = "#3b4261",
      sel_bg  = "#292e42",
    })
  end,
}
