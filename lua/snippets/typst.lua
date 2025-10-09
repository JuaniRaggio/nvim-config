local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function get_date()
    return os.date("%Y-%m-%d")
end

return {
    s("korean", fmt([[
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
)

#set text(
  font: "Noto Sans CJK KR",
  lang: "ko",
  size: 20pt,
)

// Author: Juani Raggio
// Date: 2025-10-02

#align(center)[
  #v(3cm)

  #text(size: 24pt, weight: "bold")[
    한국어
  ]

  #v(1cm)

  #grid(
    columns: (1fr, 1fr),
    align: center,
    text(size: 80pt)[🇦🇷],
    text(size: 80pt)[🇰🇷],
  )

  #v(2cm)

  #text(size: 16pt)[
    *학생:* Juan Ignacio Raggio
  ]

  #v(0.5cm)

  #text(size: 16pt)[
    *선생님:* 이선주
  ]

  #v(2cm)

  #line(length: 60%, stroke: 0.5pt)

  #v(1cm)

  #text(size: 14pt)[
    *수업:* lesson_number
  ]

  #v(0.5cm)

  #text(size: 14pt)[
    *주제:* lesson_description
  ]

  #v(1fr)

  #text(size: 12pt)[
    {}
  ]
]

#pagebreak()

{}]], {
        f(get_date),
        i(0)
    })),
    s("rta", {
        ls.text_node("#align(center)[#table()["),
        i(1),
        ls.text_node("]]")
    }),
  s("itba", fmt([[
#set document(
  title: "Tips y Errores Comunes - Arquitectura",
  author: "Juan Ignacio Raggio",
)

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 2cm,
    right: 2cm,
  ),
  numbering: "1",
  number-align: bottom + right,

  header: [
    #set text(size: 9pt, fill: gray)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      [Juan Ignacio Raggio],
      [],
      [#datetime.today().display("[day]/[month]/[year]")]
    )
    #line(length: 100%, stroke: 0.5pt + gray)
  ],

  footer: context [
    #set text(size: 9pt, fill: gray)
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.2em)
    #align(center)[
      Pagina #counter(page).display() de #counter(page).final().first()
    ]
  ]
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "es",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 0em,
  spacing: 1.2em,
)

#set heading(numbering: "1.1")
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 3): set text(size: 12pt, weight: "bold")

#show heading: it => {{
  v(0.5em)
  it
  v(0.3em)
}}

#set list(indent: 1em, marker: ("•", "◦", "▪"))
#set enum(indent: 1em, numbering: "1.a.")

#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)

#show link: underline

// ====================================
// FUNCIONES UTILES
// ====================================

// Funcion para crear una caja de nota/observacion
#let nota(contenido) = {{
  block(
    fill: rgb("#E3F2FD"),
    stroke: rgb("#1976D2") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#1976D2"))[Nota:] #contenido
  ]
}}

// Funcion para crear una caja de advertencia
#let importante(contenido) = {{
  block(
    fill: rgb("#FFF3E0"),
    stroke: rgb("#F57C00") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#F57C00"))[Importante:] #contenido
  ]
}}

// Funcion para crear una caja de error comun
#let error(contenido) = {{
  block(
    fill: rgb("#FFEBEE"),
    stroke: rgb("#D32F2F") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#D32F2F"))[Error Comun:] #contenido
  ]
}}

// Funcion para crear una caja de tip
#let tip(contenido) = {{
  block(
    fill: rgb("#E8F5E9"),
    stroke: rgb("#388E3C") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#388E3C"))[Tip:] #contenido
  ]
}}

// ====================================
// PORTADA
// ====================================

#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Arquitectura de Computadoras]
  #v(0.5em)
  #text(size: 18pt)[Tips y Errores Comunes]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Guia \
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

{}]], {
    i(0)
  }))
}
