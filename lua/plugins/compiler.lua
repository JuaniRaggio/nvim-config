return {
        {
                "Zeioth/compiler.nvim",
                cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
                dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
                opts = {},
                keys = {
                        { "<leader>co", "<cmd>CompilerOpen<cr>",          desc = "Compiler open" },
                        { "<leader>ct", "<cmd>CompilerToggleResults<cr>", desc = "Compiler toggle results" },
                        { "<leader>cc", "<cmd>CompilerRedo<cr>",          desc = "Compiler recompile" },
                },
        },
        {
                "stevearc/overseer.nvim",
                opts = {},
        },
}
