#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()

#set document(
  title: "Esercizi su Haskell",
  author: "Gioele Vuaran (matricola 167222)",
)

#let font-size = 10pt
#set text(
  font: "Libertinus Serif",
  size: font-size,
  ligatures: false,
)
#show raw: set text(font: "DejaVu Sans Mono", size: 7pt)
#set page(
  paper: "a4",
  numbering: "1",
)
#show link: underline

#show heading.where(level: 1): it => {
  pagebreak()
  it
}
#show heading.where(level: 1): it => {
  v(3.8 * font-size, weak: true) + text(it) + v(0.2 * font-size)
}
#show heading.where(level: 2): it => {
  v(0.8 * font-size) + text(it) + v(0.2 * font-size)
}
#show heading.where(level: 3): it => {
  v(0.8 * font-size) + text(it) + v(0.2 * font-size)
}

#align(
  center,
  text(18pt, weight: "bold", "Esercizi su Haskell"),
)
#v(18pt, weak: true)
#align(
  center,
  text(18pt, weight: "medium", "Linguaggi di Programmazione"),
)
#v(18pt, weak: true)

#align(
  center,
  box(inset: (top: 20pt), {
    text(15pt, weight: "semibold", "Gioele Vuaran")
  }),
)
#align(
  center,
  box(inset: (bottom: 20pt), {
    text(15pt, weight: "semibold", "(matricola 167222)")
  }),
)
#v(6pt, weak: true)

#align(
  center,
  box(inset: (y: 20pt), {
    text(
      12pt,
      "Ultimo aggiornamento: "
        + text(
          datetime.today().display(),
        ),
    )
  }),
)

#box(
  inset: (y: 80pt),
  [Nota: per una visualizzazione più efficace, gli esercizi sono stati anche
    caricati in un repository Git all'indirizzo
    #link("https://github.com/lazylace37/uni_linguaggi")],
),

#outline()

#codly(
  languages: codly-languages,
  number-format: none,
  lang-format: none,
  zebra-fill: none,
)

#let autobreak(content) = {
  layout(size => {
    let neededHeight = measure(block(width: size.width, content)).height
    if neededHeight <= size.height {
      return block(breakable: false, content)
    }

    hide(place()[.])

    colbreak()
    content
  })
}

#let show_file_aux(path, readme-path) = {
  let filename = path.match(regex(".*/(.*)")).at("captures").at(0)
  let contents = read(path)
  let readme-contents = read(readme-path)

  heading(level: 2, "Esercizio " + filename)

  raw(lang: "haskell", block: true, contents)

  let command = readme-contents
    .match(regex(
      "ghci " + filename + " -e \"(.*)\"",
    ))
    .at("captures")
    .at(0)
  if command.len() > 0 {
    raw(lang: "haskell", block: true, command)
  }
}

#let show_file(path, readme-path) = {
  autobreak(show_file_aux(path, readme-path))
}

= Numeri
#show_file("./numeri/01.hs", "./numeri/README.md")
#show_file("./numeri/02.hs", "./numeri/README.md")
#show_file("./numeri/03.hs", "./numeri/README.md")

= Liste
#show_file("./liste/01.hs", "./liste/README.md")
#show_file("./liste/02.hs", "./liste/README.md")
#show_file("./liste/03.hs", "./liste/README.md")
#show_file("./liste/04.hs", "./liste/README.md")
#show_file("./liste/05.hs", "./liste/README.md")
#show_file("./liste/05.hs", "./liste/README.md")
#show_file("./liste/06.hs", "./liste/README.md")
#show_file("./liste/07.hs", "./liste/README.md")

= Matrici
#show_file("./matrici/01.hs", "./matrici/README.md")
#show_file("./matrici/02.hs", "./matrici/README.md")
#show_file("./matrici/03.hs", "./matrici/README.md")
#show_file("./matrici/04.hs", "./matrici/README.md")
#show_file("./matrici/05.hs", "./matrici/README.md")
#show_file("./matrici/06.hs", "./matrici/README.md")
#show_file("./matrici/07.hs", "./matrici/README.md")
#show_file("./matrici/08.hs", "./matrici/README.md")
#show_file("./matrici/09.hs", "./matrici/README.md")
#show_file("./matrici/10.hs", "./matrici/README.md")
#show_file("./matrici/11.hs", "./matrici/README.md")

= Alberi Binari di Ricerca
#show_file("./bst/01.hs", "./bst/README.md")
#show_file("./bst/02.hs", "./bst/README.md")
#show_file("./bst/03.hs", "./bst/README.md")
#show_file("./bst/04.hs", "./bst/README.md")
#show_file("./bst/05.hs", "./bst/README.md")
#show_file("./bst/06.hs", "./bst/README.md")
#show_file("./bst/07.hs", "./bst/README.md")
#show_file("./bst/08.hs", "./bst/README.md")
#show_file("./bst/09.hs", "./bst/README.md")
#show_file("./bst/10.hs", "./bst/README.md")
#show_file("./bst/11.hs", "./bst/README.md")
#show_file("./bst/12.hs", "./bst/README.md")
#show_file("./bst/13.hs", "./bst/README.md")
#show_file("./bst/14.hs", "./bst/README.md")
#show_file("./bst/15.hs", "./bst/README.md")
#show_file("./bst/16.hs", "./bst/README.md")
#show_file("./bst/17.hs", "./bst/README.md")
#show_file("./bst/18.hs", "./bst/README.md")
#show_file("./bst/19.hs", "./bst/README.md")
#show_file("./bst/20.hs", "./bst/README.md")
#show_file("./bst/21.hs", "./bst/README.md")
#show_file("./bst/22.hs", "./bst/README.md")
#show_file("./bst/24.hs", "./bst/README.md")

= Alberi Generici

#show_file("./alberi_generici/01.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/02.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/03.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/04.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/05.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/06.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/07.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/08.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/10.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/11.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/12.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/13.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/15.hs", "./alberi_generici/README.md")
#show_file("./alberi_generici/16.hs", "./alberi_generici/README.md")

= Quad Trees

#show_file("./quad_trees/01.hs", "./quad_trees/README.md")
#show_file("./quad_trees/02.hs", "./quad_trees/README.md")
#show_file("./quad_trees/03.hs", "./quad_trees/README.md")
#show_file("./quad_trees/04.hs", "./quad_trees/README.md")
#show_file("./quad_trees/05.hs", "./quad_trees/README.md")
#show_file("./quad_trees/06.hs", "./quad_trees/README.md")
#show_file("./quad_trees/07.hs", "./quad_trees/README.md")
#show_file("./quad_trees/08.hs", "./quad_trees/README.md")
#show_file("./quad_trees/09.hs", "./quad_trees/README.md")
#show_file("./quad_trees/10.hs", "./quad_trees/README.md")
#show_file("./quad_trees/11.hs", "./quad_trees/README.md")
#show_file("./quad_trees/12.hs", "./quad_trees/README.md")
#show_file("./quad_trees/13.hs", "./quad_trees/README.md")
#show_file("./quad_trees/14.hs", "./quad_trees/README.md")
#show_file("./quad_trees/15.hs", "./quad_trees/README.md")
#show_file("./quad_trees/16.hs", "./quad_trees/README.md")
#show_file("./quad_trees/19.hs", "./quad_trees/README.md")
#show_file("./quad_trees/21.hs", "./quad_trees/README.md")

= Matrici mediante Quad Trees

#show_file(
  "./matrici_mediante_quad_trees/01.hs",
  "./matrici_mediante_quad_trees/README.md",
)
#show_file(
  "./matrici_mediante_quad_trees/03.hs",
  "./matrici_mediante_quad_trees/README.md",
)
#show_file(
  "./matrici_mediante_quad_trees/04.hs",
  "./matrici_mediante_quad_trees/README.md",
)
#show_file(
  "./matrici_mediante_quad_trees/08.hs",
  "./matrici_mediante_quad_trees/README.md",
)
#show_file(
  "./matrici_mediante_quad_trees/13.hs",
  "./matrici_mediante_quad_trees/README.md",
)
#show_file(
  "./matrici_mediante_quad_trees/15.hs",
  "./matrici_mediante_quad_trees/README.md",
)
