#import "../../../report/lib/titlepage.typ": titlepage

#let supervisor_contract(
  title: "",
  authors: (),
  advisors: (),
  bibliography_sources: none,
  body-font: "New Computer Modern",
  sans-font: "New Computer Modern Sans",
  body
) = {
  titlepage(
    title: title,
    authors: authors,
    advisors: advisors
  )

  set heading(numbering: "1.")
  counter(page).update(1)
  set page(
    footer: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      gutter: 6pt,
      context counter(page).display("1"),
      title
    ),
  )

  body
  pagebreak()
}

