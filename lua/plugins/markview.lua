return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    opts = {
        markdown = {
            -- Estilo "simple": conserva los '#' tal cual, sin iconos ni bloques,
            -- solo aplica el color del heading.
            headings = {
                enable = true,
                shift_width = 0,

                heading_1 = { style = "simple", hl = "MarkviewHeading1" },
                heading_2 = { style = "simple", hl = "MarkviewHeading2" },
                heading_3 = { style = "simple", hl = "MarkviewHeading3" },
                heading_4 = { style = "simple", hl = "MarkviewHeading4" },
                heading_5 = { style = "simple", hl = "MarkviewHeading5" },
                heading_6 = { style = "simple", hl = "MarkviewHeading6" },
            },

            -- Tablas: dibujar los bordes en lineas virtuales propias en vez de
            -- superponerlos en las lineas vecinas (mas robusto, no depende de
            -- que haya una linea en blanco arriba/abajo de la tabla).
            tables = {
                enable = true,
                use_virt_lines = true,
            },
        },
    },
}
