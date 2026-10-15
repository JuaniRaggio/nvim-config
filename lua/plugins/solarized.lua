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
    -- Menos colorido: mezclamos los acentos de solarized hacia el gris neutro
    -- (base0 #839496) para un resaltado mas sobrio, dejando solo un dejo de tono.
    -- `keep` = cuanto acento se conserva (0 = gris total, 1 = solarized original).
    -- El rojo lo dejamos mas presente por ser errores/diagnosticos.
    on_colors = function(colors, color)
      local neutral = colors.base0
      local keep = 0.4
      for _, name in ipairs({ "blue", "cyan", "green", "yellow", "orange", "magenta", "violet" }) do
        colors[name] = color.blend(colors[name], neutral, keep)
      end
      colors.red = color.blend(colors.red, neutral, 0.7)
      return colors
    end,
    -- Las keywords en solarized usan base1 (gris), asi que no reciben color del
    -- desaturado de acentos. Les damos un verde solarized presente para que
    -- resalten entre el gris. Para otro color, cambia `kw` (ej. "#6c71c4" violeta,
    -- "#cb4b16" naranja, "#268bd2" azul).
    on_highlights = function(colors, color)
      local kw = "#859900"  -- keywords: verde solarized
      local str = "#2aa198" -- strings: cyan solarized
      local ty = "#b58900"  -- tipos (incluye custom): amarillo solarized
      return {
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
        Keyword = { link = "@keyword" },
        Statement = { link = "@keyword" },
        Conditional = { link = "@keyword" },
        Repeat = { link = "@keyword" },

        ["@string"] = { fg = str },
        ["@string.documentation"] = { link = "@string" },
        ["@string.regexp"] = { link = "@string" },
        ["@character"] = { link = "@string" },
        String = { link = "@string" },
        Character = { link = "@string" },

        ["@type"] = { fg = ty },
        ["@type.definition"] = { link = "@type" },
        ["@type.builtin"] = { link = "@type" },
        ["@constructor"] = { link = "@type" },
        Type = { link = "@type" },
        Structure = { link = "@type" },
      }
    end,
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    require("solarized").setup(opts)
    -- No llamamos a :colorscheme aca a proposito; darkthrone sigue siendo el
    -- default (init.lua). Para usar solarized: <leader>th o :colorscheme solarized
  end,
}
