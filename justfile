clean:
    rm -rf out
    mkdir out

render:
    #!/usr/bin/bash
    typst compile pipeline/card.typ  out/card.pdf &
    typst compile pipeline/card.typ  out/card_{n}.svg

watch:
    #!/usr/bin/bash
    typst watch pipeline/card.typ  out/card.pdf &
    typst watch pipeline/card.typ  out/card_{n}.svg
