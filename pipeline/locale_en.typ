#import "./card.typ": card

#let config = toml("./cards.toml")
#config.at("people").map(card.with(locale: "en")).join(pagebreak())
