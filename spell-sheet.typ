#let spell-sheet(
/* * * HEADER * * */
  spellcasting-class: none,
  spellcasting-ability: none,
  spell-save-dc: none,
  spell-attack-bonus: none,
  
/* * * SPELLS * * */
  cantrips: (),
  lvl1_spells: (),
  lvl2_spells: (),
  lvl3_spells: (),
  lvl4_spells: (),
  lvl5_spells: (),
  lvl6_spells: (),
  lvl7_spells: (),
  lvl8_spells: (),
  lvl9_spells: (),

/* * * SPELL SLOTS * * */
  slots-total: (),
  slots-expended: list,

/* * * for rendering * * */
  settings: (
    language: "en", // only changes built-in lang features, no changes are made to the sheet text
    printer-mono: false, // true for black outlines, false for colored
    spell-rainbows: false, // changes the paper rules to rainbow gradients
    body-font: "Vollkorn"
  ),
  body: none
) = {
  set text(lang: settings.at("language"), size:14pt, font: settings.at("body-font"))
  set page(
    paper: "us-letter",
    margin: (x: 0%, y: 0%, top: 0%, bottom: 0%)
  )

  body = {
  /* * * HEADER * * */
  set text(size:23pt)
  place(
    top + center,
    dx: 10.2pt,
    dy: 63pt,
    text(spellcasting-ability, size:13pt)
  )
  place(
    top + center,
    dx: 111pt,
    dy: 60pt,
    [#spell-save-dc]
  )
  place(
    top + center,
    dx: 214.6pt,
    dy: 60pt,
    if type(spell-attack-bonus) == int {
      "+" + [#spell-attack-bonus]
    } else { 
      [#spell-attack-bonus]
    }
  )

  /* * * SPELLS * * */
  set text(size:11pt)

  // Set string to append at the end of files names when getting graphics
  let svg-color
  if settings.at("printer-mono") {
    svg-color = "-mono.svg"
  } else {
    svg-color = "-col.svg"
  }

  // Set stroke to use for all spell underlines
  let spell-stroke = 0.4pt + black.lighten(40%)
  if settings.at("spell-rainbows") {
    spell-stroke = 1pt + gradient.linear(..color.map.rainbow)
  }

  // Initialize starting position for placings
  let spell-x-counter = 32pt
  let spell-y-counter = 137.8pt

  // Print numbers of total and expended spell slots of a specific level at a specific xy-offset
  let slot-printer(lvl, xcounter, ycounter) = {
    if slots-total.len() >= lvl and slots-total.at(lvl -1) != 0 {
      place(
        center,
        dx: xcounter - 266.3pt,
        dy: 10pt + ycounter,
        text([#slots-total.at(lvl -1)], size: 19pt)
      )
    }
    if slots-expended.len() >= lvl and slots-expended.at(lvl -1) != 0 {
      place(
        top + left,
        dx: xcounter + 74pt,
        dy: ycounter + 12pt,
        text(for i in range(slots-expended.at(lvl -1)) {[I]}, size:20pt,tracking: 2pt)
      )
    }
  }

  if cantrips.len() > 0 {
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header-cantrips"+svg-color)
    )
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 9.68pt // space between header and first line
    for i in cantrips {
      place(
        top + left,
        dx: spell-x-counter,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 171.5pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 10pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 10pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 1.55pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }
  
  if lvl1_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 4.6pt,
      dy: spell-y-counter,
      image("/outlines/spell-header-lvl1"+svg-color)
    )
    slot-printer(1, spell-x-counter, spell-y-counter + 10.5pt)
    spell-y-counter += 47.89pt // size of header
    spell-y-counter += 13pt // space between header and first line
    for i in lvl1_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }

  if lvl2_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[2]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(2, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl2_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
    } else {
      spell-y-counter -= 14pt
    }
  }

  if lvl3_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[3]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(3, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl3_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
    } else {
      spell-y-counter -= 14pt
    }
  }

  if lvl4_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[4]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(4, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl4_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }

  if lvl5_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[5]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(5, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl5_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }

  if lvl6_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[6]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(6, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl6_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }
  
  if lvl7_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[7]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(7, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl7_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }
  
  if lvl8_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[8]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(8, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl8_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }
  
  if lvl9_spells.len() > 0 {
    if (spell-y-counter + 41pt) >= 750pt {
      spell-x-counter += 189pt
      spell-y-counter = 137.8pt
    }
    place(
      top + left,
      dx: spell-x-counter - 0.97pt,
      dy: spell-y-counter,
      image("/outlines/spell-header"+svg-color)
    )
    place(
      center,
      dx: spell-x-counter - 297.7pt,
      dy: 14.4pt + spell-y-counter, // 14.4pt is the space 
      text([#strong[9]], size: 11pt, font: "Noto Sans")
    )
    slot-printer(9, spell-x-counter, spell-y-counter)
    spell-y-counter += 37.12pt // size of header
    spell-y-counter += 11pt // space between header and first line
    for i in lvl9_spells {
      place(
        top + left,
        dx: spell-x-counter + 8.4pt,
//        dy: 582.2pt + i*14pt,
        dy: spell-y-counter,
        line(start: (0pt, 0pt), length: 163.1pt, stroke: spell-stroke)
      )
      place(
        top + left,
        dx: spell-x-counter + 0.35pt,
        dy: -6.2pt + spell-y-counter,
        circle(radius: 3pt, stroke: 0.7pt + black)
      )
      place(
        top + left,
        dx: spell-x-counter + 11pt,
        dy: spell-y-counter - 10pt,
        [#i]
      )
      if spell-y-counter >= 742pt {
        spell-x-counter += 189pt
        spell-y-counter = 137.8pt
      }
      spell-y-counter += 14pt
    }
    if spell-y-counter >= 151.9pt {
      spell-y-counter -= 11pt // space between last line and divider
      place(
        top + left,
        dx: spell-x-counter - 10.2pt,
        dy: spell-y-counter,
        image("/outlines/spell-divider.svg", width:190.4pt)
      )
      spell-y-counter += 6.66pt // size of divider
      spell-y-counter += 0.75pt // space between divider and header
    } else {
      spell-y-counter -= 14pt
    }
  }

  }
  // Place Background and all info added to body above
  if settings.at("printer-mono") {
    set page(
      background: image("/outlines/page-3-mono.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 67pt,
      text(spellcasting-class, size: 23pt)
    )
    body
  } else {
    set page(
      background: image("/outlines/page-3-col.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 67pt,
      text(spellcasting-class, size: 23pt)
    )
    body
  }
}
