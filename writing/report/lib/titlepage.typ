
#let titlepage(title: "", authors: (), advisors: ()) = {
  set align(center)

  v(3.5cm)

  text(24pt, weight: "bold", title)
  v(-10pt)
  // text(17pt, weight: "semibold", subtitle)
  // v(20pt)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  pad(
    x: 48pt,
    grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #link("mailto:" + author.email)
    ]),
  ))

  let count = advisors.len()
  let ncols = calc.min(count, 3)
  v(16pt)
  if count > 1 {
    text(14pt)[Advisors]
  } else {
    text(14pt)[Advisor]
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
  ))

  v(1fr)
  // frontpage-figure()
  v(1fr)

  image("../../shared/assets/images/sdu-logo.png", width: 64pt)
  text(12pt)[University of Southern Denmark]

  set align(left)
}