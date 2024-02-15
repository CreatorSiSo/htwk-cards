clean:
    rm -rf out
    mkdir out

render:
    #!/usr/bin/bash
    typst compile pipeline/locale_en.typ  out/cards_en.pdf &&
    typst compile pipeline/locale_de.typ  out/cards_de.pdf &
    typst compile pipeline/locale_en.typ  out/card_en_{n}.svg &
    typst compile pipeline/locale_de.typ  out/card_de_{n}.svg

watch:
    #!/usr/bin/bash
    typst watch pipeline/locale_en.typ  out/cards_en.pdf &
    &>/dev/null typst watch pipeline/locale_de.typ  out/cards_de.pdf &
    &>/dev/null typst watch pipeline/locale_en.typ  out/card_en_{n}.svg &
    &>/dev/null typst watch pipeline/locale_de.typ  out/card_de_{n}.svg
