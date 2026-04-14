return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "dawn",
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    })
  end,
}
