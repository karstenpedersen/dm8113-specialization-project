#let TODO(body, color: red) = {
  rect(
    width: 100%,
    radius: 3pt,
    stroke: 0.5pt,
    fill: color,
  )[
    TODO:
    #body
  ]
}
