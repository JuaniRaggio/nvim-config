return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "java", "markdown", "markdown_inline", "typst" },
			auto_install = true,
		})
		-- Iniciar treesitter highlight automaticamente
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
