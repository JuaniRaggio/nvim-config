return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	main = "nvim-treesitter",
	opts = {
		ensure_installed = { "ada", "c", "cpp", "python", "lua", "vim", "vimdoc", "java", "markdown", "typst" },
		auto_install = false,
		sync_install = false,
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = true },
	},
}
