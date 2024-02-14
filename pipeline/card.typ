#let text-primary = rgb("#ede0ce")
#let bg-primary = blue.darken(70%).desaturate(35%)
#let text-secondary = text-primary.mix(bg-primary.lighten(40%))

#set page(
  width: 6cm,
  height: 9.5cm,
  margin: (x: 0mm, y: 0mm),
  fill: bg-primary,
)
#set text(font: ("Roboto Slab"), size: 7pt, fill: text-secondary)

#let card(person) = {
  box(
    width: 100%,
    height: 50%,
    {
      let stroke-width = 0.5mm
      let stroke-colors = (
        (rgb("#f1e3cf"), 0%),
        (rgb("#a27b45"), 30%),
        (rgb("#a27b45"), 50%),
        (rgb("#f1e3cf"), 100%),
      )
      let bg-colors = (
        (bg-primary.darken(30%), 0%),
        (black, 100%),
      )
      polygon(
        stroke: (thickness: stroke-width, paint: gradient.conic(..stroke-colors)),
        fill: gradient.radial(/* angle: 90deg, */center: (50%, 0%), radius: 200%, ..bg-colors),
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
      text(size: 12pt, weight: 500, fill: text-primary, person.nickname)
      linebreak()
      [#person.titles #person.name]
    }
  )
}

#let config = toml("./cards.toml")
#config.at("people").map(card).join(pagebreak())
