#set page(
  width: 6cm,
  height: 9.5cm,
  margin: (x: 0mm, y: 0mm),
  fill: white,
)
#set text(font: ("Roboto Slab", "Noto Color Emoji"), size: 7pt)


#let config = toml("./cards.toml")
#config.at("people").map((person) => {
  box(
    width: 100%,
    height: 50%,
    {
      let stroke-width = 0.8mm
      let stroke-colors = (
        (rgb("#f1e3cf"), 0%),
        (rgb("#a27b45"), 30%),
        (rgb("#a27b45"), 50%),
        (rgb("#f1e3cf"), 100%),
      )
      polygon(
        stroke: (thickness: stroke-width, paint: gradient.conic(..stroke-colors)),
        fill: blue,
        (stroke-width/4, stroke-width/4),
        (100% - stroke-width/4, 0% + stroke-width/4),
        (100% - stroke-width/4, 90%),
        (95%, 90%),
        (85%, 100%),
        (50%, 100%),
        (40%, 90%),
        (stroke-width/4, 90%),
      )
    }
  )
  pad(
    x: 3mm,
    top: -3mm,
    {
      text(size: 12pt, weight: 500, person.nickname)
      linebreak()
      [#person.titles #person.name]
    }
  )
}).join(pagebreak())
