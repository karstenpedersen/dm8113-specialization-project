#import "../metadata.typ": *
#import "../admin/lib/project_description_template.typ": project_description

#import "../shared/lib/todo.typ": TODO

#set document(title: title)

#show: project_description.with(
  title: title,
  authors: authors,
  advisors: advisors,
  bibliography_sources: "../references.bib",
)

= Motivation
#TODO[]

= Tentative Timeplan
#TODO[]

= Risk Assessment
#TODO[]

= Outcome
#TODO[]
