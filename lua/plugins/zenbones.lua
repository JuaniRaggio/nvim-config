return {
  "zenbones-theme/zenbones.nvim",
  -- zenbones esta hecho con lush.nvim, que es dependencia obligatoria.
  dependencies = { "rktjmp/lush.nvim" },
  -- lazy=false para que el picker de colorschemes (<leader>th) lo liste y lo
  -- previsualice. priority alta para que gane si se fija como default.
  lazy = false,
  priority = 1000,
  config = function()
    -- La familia zenbones da contexto con ESTILOS (italic/bold) en vez de
    -- saturar de color, igual que quiet pero bien mantenido. El fondo lo
    -- dejamos transparente para respetar la opacidad de kitty (igual que hace
    -- el autocmd enable_transparency de init.lua).
    local opts = {
      transparent_background = true,
      italic_comments = true,
      solid_line_nr = true,
      -- comentarios un poco apagados respecto al codigo, pero legibles
      darken_comments = 45,
    }
    -- zenwritten = la variante 100% monocromatica (escala de grises), la mas
    -- parecida a quiet. zenbones = casi mono con un tinte calido. Configuramos
    -- ambas por si queres alternarlas desde <leader>th.
    vim.g.zenwritten = opts
    vim.g.zenbones = opts
  end,
}
