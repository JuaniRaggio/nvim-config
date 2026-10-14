return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },

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

    config = function(_, opts)
        require("markview").setup(opts)

        -- citylights usa el mismo color para todos los niveles de heading, y
        -- markview deriva el color de cada callout del heading de ese nivel, asi
        -- que [!NOTE]/[!WARNING]/[!IMPORTANT]/etc. salian todos iguales. Forzamos
        -- colores distintos (estilo GitHub) para cada tipo de callout.
        local function set_callout_colors()
            local colors = {
                MarkviewBlockQuoteNote    = "#539bf5", -- [!NOTE]
                MarkviewBlockQuoteOk      = "#57ab5a", -- [!TIP]
                MarkviewBlockQuoteSpecial = "#b083f0", -- [!IMPORTANT]
                MarkviewBlockQuoteWarn    = "#d29922", -- [!WARNING]
                MarkviewBlockQuoteError   = "#e5534b", -- [!CAUTION]
            }
            for group, color in pairs(colors) do
                vim.api.nvim_set_hl(0, group, { fg = color, bg = "NONE" })
            end
        end

        set_callout_colors()
        -- Reaplicar despues de que markview regenere sus highlights en cada cambio de tema.
        vim.api.nvim_create_autocmd("ColorScheme", { callback = set_callout_colors })
    end,
}
