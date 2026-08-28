
#let titlepage(title: "", subtitle: "", authors: (), advisors: ()) = {
  set align(center)

  v(3.5cm)

  text(24pt, weight: "bold", title)
  v(-10pt)
  text(17pt, weight: "semibold", subtitle)
  v(20pt)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  v(16pt)
  if count > 1 {
    text(14pt)[#smallcaps[Authors]]
  } else {
    text(14pt)[#smallcaps[Author]]
  }
  pad(
    x: 48pt,
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 24pt,
      ..authors.map(author => [
        #author.name \
        #link("mailto:" + author.email)
      ]),
    ),
  )

  let count = advisors.len()
  let ncols = calc.min(count, 3)
  v(16pt)
  if count > 1 {
    text(14pt)[#smallcaps[Supervisors]]
  } else {
    text(14pt)[#smallcaps[Supervisor]]
  }
  pad(
    x: 48pt,
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 24pt,
      ..advisors.map(advisor => [
        #advisor.name \
        #link("mailto:" + advisor.email)
      ]),
    ),
  )

  v(1fr)

  image("../../shared/assets/images/sdu-logo.png", width: 64pt)
  text(12pt)[University of Southern Denmark]
  linebreak()
  text(12pt)[Department of Mathematics and Computer Science]

  set align(left)
}
