vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.guicursor = ""

vim.o.guicursor = "n-v-c-sm:block-blinkon500-blinkoff500-blinkwait500,i-ci-ve:hor40-blinkon500-blinkoff500-blinkwait500"

vim.opt.cursorline = true

vim.opt.cmdheight = 0

vim.diagnostic.config({
  float = { border = "rounded" },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local log = vim.lsp.get_log_path()
    local f = io.open(log, "w")
    if f then f:close() end
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    io.write("\27[0 q")
  end,
})

