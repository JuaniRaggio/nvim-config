return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_maps = {
      ["Add Cursor Down"] = "gzj",
      ["Add Cursor Up"] = "gzk",
      ["Find Under"] = "gzm",
    }
  end,
  config = function()
    vim.keymap.set("n", "gzw", function()
      vim.cmd([[call vm#commands#add_cursor_at_pos(0)]])
      vim.cmd("normal! w")
    end, { desc = "Add cursor at next word" })

    vim.keymap.set("n", "gzW", function()
      vim.cmd([[call vm#commands#add_cursor_at_pos(0)]])
      vim.cmd("normal! W")
    end, { desc = "Add cursor at next WORD" })
  end,
}
