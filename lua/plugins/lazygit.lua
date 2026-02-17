return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = "LazyGit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_floating_window_scaling_factor = 1
  end,
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
}
