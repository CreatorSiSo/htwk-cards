#import "./card.typ": card

#let config = json("./cards.json")
#config.at("people").map(card.with(locale: "en")).join(pagebreak())
