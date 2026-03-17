#import "characters/settings.typ": *

#let spell-sheet(
/* * * HEADER * * */
  
/* * * SPELLS * * */
  spell-rainbows: false, // changes the paper rules to rainbow gradients
  cantrips: ("a", "b", "c", "a", "b"),
  lvl1_spells: ("a", "b", "c", "a", "b", "c", "a", "b", "a", "b", "c", "a", "b", "b", "a"),
  lvl2_spells: ("a", "b", "c", "a"),
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

  /* * * SPELLS * * */
  let svg-color
  if printer-mono {
    svg-color = "-mono.svg"
  } else {
    svg-color = "-col.svg"
  }

  let spell-stroke = 0.4pt + black.lighten(40%)
  if spell-rainbows {
    spell-stroke = 1pt + gradient.linear(..color.map.rainbow)
  }

  let spell-space-counter = 137.8pt

  if cantrips.len() > 0 {
    place(
      top + left,
      dx: 31.03pt,
      dy: spell-space-counter,
      image("/spell-header-cantrips"+svg-color)
    )
    spell-space-counter += 37.12pt // size of header
    spell-space-counter += 9.68pt // space between header and first line
    for i in cantrips {
      place(
        top + left,
        dx: 32pt,
        dy: spell-space-counter,
        line(start: (0pt, 0pt), length: 171.5pt, stroke: spell-stroke)
      )
      spell-space-counter += 14pt
    }
    spell-space-counter -= 10pt // space between last line and divider
    place(
      top + left,
      dx: 21.8pt,
      dy: spell-space-counter,
      image("/spell-divider.svg", width:190.4pt)
    )
    spell-space-counter += 6.66pt // size of divider
  }
  
  if lvl1_spells.len() > 0 {
    spell-space-counter += 1.55pt // space between divider and header
    place(
      top + left,
      dx: 27.4pt,
      dy: spell-space-counter,
      image("/spell-header-lvl1"+svg-color)
    )
    spell-space-counter += 47.89pt // size of header
    spell-space-counter += 13pt // space between header and first line
    for i in lvl1_spells {
      place(
        top + left,
        dx: 40.4pt,
        dy: spell-space-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: 32.35pt,
        dy: -6.2pt + spell-space-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      spell-space-counter += 14pt
    }
    spell-space-counter -= 11pt // space between last line and divider
    place(
      top + left,
      dx: 21.8pt,
      dy: spell-space-counter,
      image("/spell-divider.svg", width:190.4pt)
    )
    spell-space-counter += 6.66pt // size of divider
  }

  if lvl2_spells.len() > 0 {
    spell-space-counter += 0.75pt // space between divider and header
    place(
      top + left,
      dx: 31.03pt,
      dy: spell-space-counter,
      image("/spell-header"+svg-color)
    )
    place(
      center,
      dx: -265.7pt,
      dy: 14pt + spell-space-counter, // 14pt is the space 
      text([#strong[2]], size: 12pt, font: "Noto Sans")
    )
    spell-space-counter += 37.12pt // size of header
    spell-space-counter += 11pt // space between header and first line
    for i in lvl2_spells {
      place(
        top + left,
        dx: 40.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-space-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: 32.35pt,
        dy: -6.2pt + spell-space-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      spell-space-counter += 14pt
    }
    spell-space-counter -= 11pt // space between last line and divider
    place(
      top + left,
      dx: 21.8pt,
      dy: spell-space-counter,
      image("/spell-divider.svg", width:190.4pt)
    )
    spell-space-counter += 6.66pt // size of divider

    /*
    let thing(test) = context {
      let a = measure(test)
      [Width of "#test" is #a.width]
      place(
        top + left,
        dx: 31.03pt,
        dy: 137.8pt + spell-space-counter,
        [#a]
      )
    }
    thing[#image("/spell-header-lvl1"+svg-color)]
    */
  }
  }

  // Place Background and all info added to body above
  if printer-mono {
    set page(
      background: image("page-3-mono.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 69pt,
      text("test", size: 20pt)
    )
    body
  } else {
    set page(
      background: image("page-3-col.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 69pt,
      text("test", size: 20pt)
    )
    body
  }
}