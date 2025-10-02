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
    })
}
