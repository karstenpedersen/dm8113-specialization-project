#import "../../report/lib/titlepage.typ": *

#let project_description(
  title: "",
  subtitle: "",
  authors: (),
  advisors: (),
  bibliography_sources: none,
  body-font: "New Computer Modern",
  sans-font: "New Computer Modern Sans",
  body,
) = {
  set document(
    title: title,
    author: authors.at(0).name,
  )

  titlepage(
    title: title,
    subtitle: subtitle,
    authors: authors,
    advisors: advisors,
  )

  set heading(numbering: "1.")
  counter(page).update(1)
  set page(
    footer: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      gutter: 6pt,
      context counter(page).display("1"), title,
    ),
  )

  counter(page).update(1)

  body
  pagebreak()

  bibliography(bibliography_sources)
}

