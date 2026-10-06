return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function()
      local ft = vim.bo.filetype
      if ft == "NeogitStatus" or ft == "NeogitCommitMessage" or ft:find("^Neogit") then return end
      require("flash").jump()
    end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function()
      local ft = vim.bo.filetype
      if ft == "NeogitStatus" or ft == "NeogitCommitMessage" or ft:find("^Neogit") then return end
      require("flash").treesitter()
    end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
