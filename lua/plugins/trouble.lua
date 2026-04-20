return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<leader>fe", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (project)" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
  },
  opts = {
    icons = {
      indent = {
        middle = " ",
        last = " ",
        top = " ",
        ws = "  ",
      },
      folder_closed = ">",
      folder_open = "v",
      kinds = {},
    },
    use_diagnostic_signs = true,
  },
}
