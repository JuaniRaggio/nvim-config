return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      transparent = true,
      theme = "dragon",
      background = {
        dark = "dragon",
      },
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        statements = { bold = true },
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "NONE",
            },
          },
        },
      },
      overrides = function(colors)
        return {
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          StatusLine = { bg = "NONE" },
          VertSplit = { bg = "NONE" },
        }
      end,
    })
  end,
}
