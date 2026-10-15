return {
  "maxmx03/solarized.nvim",
  -- lazy=false para que el picker de colorschemes (<leader>th) lo liste y lo
  -- previsualice en vivo. priority < black-metal (1000) para que darkthrone
  -- siga siendo el default que fija init.lua.
  lazy = false,
  priority = 900,
  opts = {
    -- No seteamos transparent aca: el autocmd global enable_transparency
    -- (init.lua) ya limpia el fondo en cada cambio de tema, asi que solarized
    -- usa el fondo de kitty (que tambien es solarized).
    styles = {
      comments = { italic = true },
    },
    -- POCOS colores (no desaturar todo): ponemos TODOS los acentos de syntax
    -- directamente en el gris/azul neutro (base0 #839496), limpio, sin tintes
    -- mugrientos. Asi functions, variables, numeros, operadores, etc. quedan
    -- neutros, y las pocas categorias de abajo llevan su color solarized PLENO.
    on_colors = function(colors, _)
      local neutral = colors.base0
      for _, name in ipairs({ "blue", "cyan", "green", "yellow", "orange", "magenta", "violet" }) do
        colors[name] = neutral
      end
      return colors
    end,
    -- Las unicas categorias con color (pleno). El resto queda neutro por el
    -- on_colors de arriba. Los hex son explicitos para no depender de la paleta.
    on_highlights = function(_, _)
      local kw = "#859900"   -- keywords: verde
      local ty = "#b58900"   -- tipos builtin (int/double): amarillo
      local tyc = "#5fb3e6"  -- tipos de datos custom: celeste
      local str = "#2aa198"  -- strings: cyan
      local cmt = "#6c9bd0"  -- comentarios: azul claro (mas visible que el gris)
      local err = "#dc322f"  -- errores: rojo
      local warn = "#cb4b16" -- warnings: naranja
      local brk = "#a8d1ff"  -- brackets ()[]{}<> delimitadores: celeste claro
      return {
        -- keywords
        ["@keyword"] = { fg = kw, bold = true },
        ["@keyword.function"] = { link = "@keyword" },
        ["@keyword.return"] = { link = "@keyword" },
        ["@keyword.operator"] = { link = "@keyword" },
        ["@keyword.conditional"] = { link = "@keyword" },
        ["@keyword.repeat"] = { link = "@keyword" },
        ["@keyword.exception"] = { link = "@keyword" },
        ["@keyword.import"] = { link = "@keyword" },
        ["@conditional"] = { link = "@keyword" },
        ["@repeat"] = { link = "@keyword" },
        -- OJO: los grupos legacy (Keyword/Operator/String...) NO deben linkear a
        -- los @grupos de treesitter. Neovim ya linkea al reves por defecto
        -- (@keyword -> Keyword, @operator -> Operator, @string -> String), asi
        -- que linkear de vuelta crea un ciclo (@operator <-> Operator) que el
        -- resolvedor recursivo de solarized.nvim sigue para siempre -> nvim se
        -- cuelga al cargar el colorscheme. Por eso van con fg explicito.
        Keyword = { fg = kw, bold = true },
        Conditional = { fg = kw, bold = true },
        Repeat = { fg = kw, bold = true },

        -- operadores (+ - * / = << -> && etc): verde normal, para distinguirlos
        -- de las keywords (verde bold) sin agregar un color nuevo
        ["@operator"] = { fg = kw },
        Operator = { fg = kw },

        -- brackets delimitadores ()[]{} y <> de templates: celeste claro, para
        -- seguir los scopes. Los <> de comparacion quedan como @operator (verde).
        ["@punctuation.bracket"] = { fg = brk },

        -- al pararse sobre un bracket, su par se resalta en amarillo (bold)
        MatchParen = { fg = "#e4c000", bold = true },

        -- tipos de datos: custom en celeste, builtin (int/double) en ambar bold.
        -- Treesitter es la unica fuente (semantic tokens del LSP desactivados en
        -- lspconfig.lua), asi que estos grupos mandan sin que el LSP los pise.
        ["@type"] = { fg = tyc },
        ["@type.definition"] = { link = "@type" },
        ["@type.builtin"] = { fg = ty, bold = true },

        -- strings
        ["@string"] = { fg = str },
        ["@string.documentation"] = { link = "@string" },
        ["@string.regexp"] = { link = "@string" },
        ["@character"] = { link = "@string" },
        String = { fg = str },
        Character = { fg = str },

        -- comentarios en color notable
        ["@comment"] = { fg = cmt, italic = true },
        Comment = { fg = cmt, italic = true },

        -- errores / warnings bien visibles (el muting los apagaba)
        DiagnosticError = { fg = err },
        DiagnosticWarn = { fg = warn },
        DiagnosticUnderlineError = { undercurl = true, sp = err },
        DiagnosticUnderlineWarn = { undercurl = true, sp = warn },
        ["@comment.error"] = { fg = err, bold = true },
        ["@comment.warning"] = { fg = warn, bold = true },
      }
    end,
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    require("solarized").setup(opts)
  end,
}
