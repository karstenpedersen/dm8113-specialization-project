#import "@preview/glossarium:0.5.10": (
  gls, glspl, make-glossary, print-glossary, register-glossary,
)

#import "./titlepage.typ": titlepage
#import "./abstract.typ": abstract
#import "./preface.typ": preface as preface_layout
#import "./ai_usage.typ": ai_usage as ai_usage_layout
#import "./appendix.typ": appendix as appendix_layout

#let report(
  title: "",
  authors: (),
  advisors: (),
  glosseries: (),
  bibliography_sources: none,
  preface: "",
  abstract_en: "",
  abstract_da: "",
  ai_usage: "",
  appendix: "",
  body-font: "New Computer Modern",
  sans-font: "New Computer Modern Sans",
  body,
) = {
  titlepage(
    title: title,
    authors: authors,
    advisors: advisors,
  )

  pagebreak()

  counter(page).update(1)

  preface_layout[#preface]

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    footer: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      gutter: 6pt,
      context counter(page).display("i"), title,
    ),
  )
  abstract(lang: "en")[#abstract_en]
  abstract(lang: "da")[#abstract_da]

  ai_usage_layout[#ai_usage]

  // --- Paragraphs ---
  set par(leading: 1em)

  // --- Citations ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)

  // --- Table of Contents ---
  outline(
    title: {
      text(font: body-font, 1.5em, weight: 700, "Contents")
      v(15mm)
    },
    depth: 2,
    indent: 2em,
  )

  v(2.4fr)
  pagebreak()

  heading[Glosseries]
  show: make-glossary
  register-glossary(glosseries)
  print-glossary(glosseries)
  pagebreak()

  // Main content
  set par(justify: true, first-line-indent: 2em)

  set heading(numbering: "1.")
  counter(page).update(1)
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    footer: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      gutter: 6pt,
      context counter(page).display("1"), title,
    ),
  )

  body
  pagebreak()

  bibliography(bibliography_sources)
  pagebreak()

  appendix_layout[#appendix]
}
