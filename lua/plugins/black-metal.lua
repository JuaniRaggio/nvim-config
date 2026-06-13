return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Tema mono-acento (negro + grises + un solo color). NO se le aplica el
    -- esquema "minimal" porque ya nace minimalista; los acentos de tokyonight/
    -- everforest lo arruinarian.
    require("black-metal").setup({
      theme = "bathory", -- bathory | burzum | gorgoroth | immortal | marduk | mayhem | nile | venom | darkthrone | emperor | ...
      variant = "dark",
      transparent = true,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "none",
      },
    })
    -- Para activarlo: :colorscheme bathory  (nombre de la banda, no "black-metal")
  end,
}
