// Pandoc Typst template — Japanese document
#set document(
  title: "$title$",
  author: "$for(author)$$author$$sep$, $endfor$",
)

#set page(
  paper: "a4",
  margin: (top: 25mm, right: 25mm, bottom: 25mm, left: 25mm),
)

#set text(
  lang: "ja",
  font: ("Noto Serif CJK JP", "Noto Serif"),
  size: 11pt,
)

#show raw: set text(
  font: ("Noto Sans Mono CJK JP", "Courier New"),
  size: 9pt,
)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(above: 1.5em, below: 0.8em)[
    #set text(size: 18pt, weight: "bold")
    #it.body
  ]
}

$if(title)$
#align(center)[
  #block(above: 3em, below: 1em)[
    #set text(size: 22pt, weight: "bold")
    $title$
  ]
  $if(author)$
  #block(below: 0.5em)[
    #set text(size: 13pt)
    $for(author)$$author$$sep$, $endfor$
  ]
  $endif$
  $if(date)$
  #block(below: 2em)[
    #set text(size: 11pt, fill: gray)
    $date$
  ]
  $endif$
]
$endif$

$if(toc)$
#outline(title: "目次")
#pagebreak()
$endif$

$body$
