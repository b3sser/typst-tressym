#import "characters/settings.typ": *

#let details-sheet(
/* * * HEADER * * */
  name: str,
  age: str,
  height: str,
  weight: str,
  eyes: str,
  skin: str,
  hair: str,
/* * * IMAGES * * */
  appearance: none,
  symbol: none,
  symbol-name: str,
/* * * TEXT FIELDS * * */
  backstory: str,
  allies_organizations: str,
  additional_features_traits: str,
  treasure: str,
/* * * for rendering * * */
  body: none
) = {
  set text(lang: language, size:14pt, font: body-font)
  set page(
    paper: "us-letter",
    margin: (x: 0%, y: 0%, top: 0%, bottom: 0%)
  )

  body = {
  /* * * HEADER * * */
  set text(size:13pt)
  place(
    top + left,
    dx: 268pt,
    dy: 52pt,
    [#age]
  )
  place(
    top + left,
    dx: 378pt,
    dy: 52pt,
    [#height]
  )
  place(
    top + left,
    dx: 474pt,
    dy: 52pt,
    [#weight]
  )
  place(
    top + left,
    dx: 268pt,
    dy: 80pt,
    [#eyes]
  )
  place(
    top + left,
    dx: 378pt,
    dy: 80pt,
    [#skin]
  )
  place(
    top + left,
    dx: 474pt,
    dy: 80pt,
    [#hair]
  )

  /* * * IMAGES * * */
  if appearance != none {
    place(
      top + left,
      dx: 36pt,
      dy: 131.4pt,
      appearance
    )
  }
  if symbol != none {
    place(
      top + left,
      dx: 422pt,
      dy: 163pt,
      symbol
    )
  }
  place(
    center,
    dx: 186.1pt,
    dy: 152.6pt,
    text(symbol-name, size: 10pt)
  )

  /* * * TEXT FIELDS * * */
  place(
    top + left,
    dx: 36pt,
    dy: 387.2pt,
    block(width: 162pt, par(justify: true, leading:4.5pt, text(backstory, size: 10pt)))
  )
  place(
    top + left,
    dx: 225pt,
    dy: 132pt,
    block(width: 168pt, par(justify: true, leading:4.5pt, text(allies_organizations, size: 10pt)))
  )
  place(
    top + left,
    dx: 225pt,
    dy: 376pt,
    block(width: 350pt, height: 214pt, columns(2, gutter: 12pt)[#par(justify: true, leading:4.8pt, text(additional_features_traits, size: 10pt))])
  )
  place(
    top + left,
    dx: 225pt,
    dy: 604pt,
    block(width: 350pt, height: 164pt, columns(2, gutter: 12pt)[#par(justify: true, leading:4.8pt, text(treasure, size: 10pt))])
  )
  }

  // Place Background and all info added to body above
  if printer-mono {
    set page(
      background: image("/outlines/page-2-mono.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 69pt,
      text(name, size: 20pt)
    )
    body
  } else {
    set page(
      background: image("/outlines/page-2-col.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 69pt,
      text(name, size: 20pt)
    )
    body
  }
}