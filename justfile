website_out := "dist"
typst_out := "website/public/cards"

clean:
    rm -rf {{website_out}}/*
    rm -f {{typst_out}}/*
    mkdir {{website_out}} -p
    mkdir {{typst_out}} -p

build:
    just clean && just typst-build && just astro-build

astro-preview:
    npx astro preview

astro-build:
    npx astro build

astro-dev:
    npx astro dev

typst-build:
    #!/usr/bin/bash
    typst compile pipeline/locale_en.typ  {{typst_out}}/cards_en.pdf &&
    typst compile pipeline/locale_de.typ  {{typst_out}}/cards_de.pdf &&
    typst compile pipeline/locale_en.typ  {{typst_out}}/card_en_{n}.svg &&
    typst compile pipeline/locale_de.typ  {{typst_out}}/card_de_{n}.svg

typst-dev:
    #!/usr/bin/bash
    typst watch pipeline/locale_en.typ  {{typst_out}}/cards_en.pdf &
    &>/dev/null typst watch pipeline/locale_de.typ  {{typst_out}}/cards_de.pdf &
    &>/dev/null typst watch pipeline/locale_en.typ  {{typst_out}}/card_en_{n}.svg &
    &>/dev/null typst watch pipeline/locale_de.typ  {{typst_out}}/card_de_{n}.svg
