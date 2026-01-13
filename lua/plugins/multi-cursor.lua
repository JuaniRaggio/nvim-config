return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_maps = {
      ["Add Cursor Down"] = "gzj",
      ["Add Cursor Up"] = "gzk",
      ["Find Under"] = "gzm",
    }
  end,
}
