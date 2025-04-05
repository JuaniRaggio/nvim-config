return {
  "christoomey/vim-tmux-navigator",
    cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-c><C-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-c><C-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-c><C-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-c><C-l>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
