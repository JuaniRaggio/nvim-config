return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		-- API de la rama main: install() reemplaza a ensure_installed/auto_install
		require("nvim-treesitter").install({
			"c",
			"cpp",
			"python",
			"lua",
			"vim",
			"vimdoc",
			"java",
			"markdown",
			"markdown_inline",
			"typst",
			"elixir",
			"heex",
			"eex",
			"sql",
			"javascript",
			"typescript",
			"tsx",
		})
		-- Iniciar treesitter highlight automaticamente
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
