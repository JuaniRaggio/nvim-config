return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
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
  end,
}
