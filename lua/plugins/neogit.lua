return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  build = ":Neogit",
  init = function()
    -- Generate helptags for neogit
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyInstall",
      callback = function()
        vim.cmd("helptags ALL")
      end,
    })
  end,
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      integrations = {
        telescope = true,
        diffview = true,
      },
      graph_style = "unicode",
      auto_refresh = true,
      sort_branches = "-committerdate",
      remember_settings = true,
      status = {
        recent_commit_count = 10,
      },
      commit_popup = {
        kind = "split",
      },
      popup = {
        kind = "split",
      },
      signs = {
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
      },
    })
  end,
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
    { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit Push" },
    { "<leader>gl", "<cmd>Neogit pull<cr>", desc = "Neogit Pull" },
  },
}
