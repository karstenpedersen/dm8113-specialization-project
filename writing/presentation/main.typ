// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *

#import "../metadata.typ": *
#import "./lib/presentation_template.typ": presentation

#set document(title: title)

#show: presentation.with(
  title: title,
  authors: authors,
  advisors: advisors,
)


#slide[
  = First slide

  Some static text on this slide.
]

#slide[
  = Conclusion

  Some static text on this slide.
]
