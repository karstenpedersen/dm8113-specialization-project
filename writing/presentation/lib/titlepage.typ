#import "@preview/polylux:0.4.0": *

#let titlepage(title: "", subtitle: "", authors: (), advisors: ()) = {
  set page(
    footer: {
      let count = authors.len()
      stack(
        ..authors.map(author => [
          #author.name
          #link("mailto:" + author.email)
        ]),
      )
    },
  )

  slide[
    #set align(horizon)
    #text(size: 32pt, weight: 700)[#title]

    #if subtitle != "" {
      text(size: 24pt)[#subtitle]
    }

    July 23, 2023
  ]
}