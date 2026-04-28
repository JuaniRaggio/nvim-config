return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt" },
      python = { "black" },
      elixir = { "mix" },
    },
  },
}
