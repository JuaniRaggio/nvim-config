return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({
            pickers = {
                colorscheme = {
                    color_devicons = true,
                    enable_preview = true,
                },
            },
        --     preview = {
        --         filesize_limit = 1, -- Limita el tamaño del archivo para vista previa
        --     },
        --     extensions = {
        --         media_files = {
        --             filetypes = { "png", "jpg", "jpeg", "gif", "webp" },
        --             -- Agrega más tipos de archivos si es necesario
        --         },
        --     },
         })
    end,
}
