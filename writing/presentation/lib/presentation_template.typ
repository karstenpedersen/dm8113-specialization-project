#import "@preview/polylux:0.4.0": slide, toolbox

#import "./titlepage.typ": titlepage
#import "./end_slide.typ": end-slide

#let presentation(
  title: "",
  authors: (),
  advisors: (),
  body-font: "New Computer Modern",
  sans-font: "New Computer Modern Sans",
  body,
) = {
  set page(paper: "presentation-16-9")
  set text(size: 20pt, font: sans-font)

  titlepage(
    title: title,
    authors: authors,
    advisors: advisors,
  )
  pagebreak()

  show outline.entry: it => {
    pad(
      y: 4pt,
      text(size: 24pt)[
        #link(
          it.element.location(),
          it.indented(sym.bullet, it.body()),
        )
      ],
    )
  }

  slide[
    #toolbox.side-by-side[
      #v(1fr)
      #text(size: 42pt, weight: 700)[Outline]
      #v(1fr)
    ][
      #v(1fr)
      #outline(depth: 1, title: none)
      #v(1fr)
    ]
  ]
  pagebreak()

  counter(page).update(1)

  body
  pagebreak()

  end-slide()
}
