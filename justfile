clean:
    rm -rf dist
    mkdir dist

build:
    just typst-compile && just astro-build

astro-preview:
    npx astro preview

astro-build:
    npx astro build

astro-dev:
    npx astro dev

typst-build:
    #!/usr/bin/bash
    typst compile pipeline/locale_en.typ  dist/images/cards_en.pdf &&
    typst compile pipeline/locale_de.typ  dist/images/cards_de.pdf &&
    typst compile pipeline/locale_en.typ  dist/images/card_en_{n}.svg &&
    typst compile pipeline/locale_de.typ  dist/images/card_de_{n}.svg &&

typst-dev:
    #!/usr/bin/bash
    typst watch pipeline/locale_en.typ  dist/images/cards_en.pdf &
    &>/dev/null typst watch pipeline/locale_de.typ  dist/images/cards_de.pdf &
    &>/dev/null typst watch pipeline/locale_en.typ  dist/images/card_en_{n}.svg &
    &>/dev/null typst watch pipeline/locale_de.typ  dist/images/card_de_{n}.svg
