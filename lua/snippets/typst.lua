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
#set text(
  font: "Noto Sans CJK KR",
  lang: "ko",
  size: 20pt,
)

// Author: Juani Raggio
// Date: {}

{}]], {
        f(get_date),
        i(0)
    })),

    s("conclusion", fmt([[
#align(center)[#table()[{}]]]], {
        i(0)
    }))
}
