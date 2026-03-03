return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
      background = "hard",
      transparent_background_level = 2,
      italics = true,
      disable_italic_comments = false,
    })
  end,
}
