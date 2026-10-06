return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      transparent = true,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "none",
      },
    })

    local function set_diff_highlights()
      local green = "#a3be8c"
      local red = "#bf616a"
      local green_bg = "#1e2a1e"
      local red_bg = "#2a1e1e"

      -- Lineas agregadas en verde, eliminadas en rojo (Neogit)
      vim.api.nvim_set_hl(0, "NeogitDiffAdd", { fg = green, bg = green_bg })
      vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = green, bg = green_bg, bold = true })
      vim.api.nvim_set_hl(0, "NeogitDiffDelete", { fg = red, bg = red_bg })
      vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = red, bg = red_bg, bold = true })

      -- Grupos base de diff (diffview y nativo)
      vim.api.nvim_set_hl(0, "DiffAdd", { fg = green, bg = green_bg })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = red, bg = red_bg })
    end

    set_diff_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_diff_highlights,
    })
  end,
}
