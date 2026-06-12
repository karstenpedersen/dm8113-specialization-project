#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

#import "../metadata.typ": *
#import "./lib/report_template.typ": report

#set document(title: title)

#show: report.with(
  title: title,
  authors: authors,
  advisors: advisors,
  glosseries: glosseries,
  bibliography_sources: "../references.bib",
  preface: include "content/01_preface.typ",
  abstract_en: include "content/02_abstract_en.typ",
  abstract_da: include "content/03_abstract_da.typ",
  ai_usage: include "content/04_ai_usage.typ",
  appendix: include "content/91_appendix.typ",
)

#include "content/11_introduction.typ"
#include "content/90_conclusion.typ"
