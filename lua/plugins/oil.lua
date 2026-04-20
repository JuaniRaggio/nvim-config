return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    require("oil").setup({
      confirmation = {
        border = "rounded",
      },
      columns = {
        "permissions",
        "size",
        "mtime",
        -- "icon",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
