return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("solarized").setup({
      transparent = {
        enabled = true,
      },
      palette = "solarized",
      variant = "autumn",
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        statements = { bold = true },
      },
    })
  end,
}
