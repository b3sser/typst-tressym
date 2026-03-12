#import "calculations.typ": *

#let body-font = "Vollkorn" // Suggested: Vollkorn, Kalam


#let print-header(
  class: str, 
  subclass: str, 
  level: int, 
  background: str, 
  player: str, 
  species: str, 
  alignment: str, 
  xp: int,
  xp-type: str
) = {
  /* * * HEADER * * */
  place(
    top + left,
    dx: 271pt,
    dy: 65.5pt,
    text([CLASS & LEVEL], size: 7pt, font: "Gillius ADF")
  )
  place(
    top + left,
    dx: 270pt,
    dy: 77pt,
    [#species]
  )
  place(
    top + left,
    dx: 271pt,
    dy: 91.6pt,
    text([RACE], size: 7pt, font: "Gillius ADF")
  )
  place(
    top + left,
    dx: 381pt,
    dy: 77pt,
    alignment_long(code: alignment)
  )
  place(
    top + left,
    dx: 383.7pt,
    dy: 91.6pt,
    text([ALIGNMENT], size: 7pt, font: "Gillius ADF")
  )

  if xp-type == "none" {
    place(
      top + left,
      dx: 270pt,
      dy: 50pt,
      [#class #h(10pt) #level]
    )
    place(
      top + left,
      dx: 381pt,
      dy: 50pt,
      [#subclass]
    )
    place(
      top + left,
      dx: 383.7pt,
      dy: 65.5pt,
      text([SUBCLASS], size: 7pt, font: "Gillius ADF")
    )
    place(
      top + left,
      dx: 480pt,
      dy: 50pt,
      [#background]
    )
    place(
      top + left,
      dx: 480.5pt,
      dy: 65.5pt,
      text([BACKGROUND], size: 7pt, font: "Gillius ADF")
    )
    place(
      top + left,
      dx: 480pt,
      dy: 77pt,
      [#player]
    )
    place(
      top + left,
      dx: 480.5pt,
      dy: 91.6pt,
      text([PLAYER NAME], size: 7pt, font: "Gillius ADF")
    )
  } else {
    place(
      top + left,
      dx: 270pt,
      dy: 50pt,
      [#class (#subclass) #h(10pt) #level]
    )
    place(
      top + left,
      dx: 381pt,
      dy: 50pt,
      [#background]
    )
    place(
      top + left,
      dx: 383.7pt,
      dy: 65.5pt,
      text([BACKGROUND], size: 7pt, font: "Gillius ADF")
    )
    place(
      top + left,
      dx: 480pt,
      dy: 50pt,
      [#player]
    )
    place(
      top + left,
      dx: 480.5pt,
      dy: 65.5pt,
      text([PLAYER NAME], size: 7pt, font: "Gillius ADF")
    )
    if xp-type == "milestone" {
      place(
        top + left,
        dx: 480pt,
        dy: 77pt,
        [#xp]
      )
      place(
        top + left,
        dx: 480.5pt,
        dy: 91.6pt,
        text([MILESTONES], size: 7pt, font: "Gillius ADF")
      )
    } else {
      place(
        top + left,
        dx: 480pt,
        dy: 77pt,
        [#xp]
      )
      place(
        top + left,
        dx: 480.5pt,
        dy: 91.6pt,
        text([EXPERIENCE POINTS], size: 7pt, font: "Gillius ADF")
      )
    }
  }
}

#let print-base-stats(
  stren: int, 
  dex: int,
  con: int,
  intel: int,
  wis: int,
  cha: int
) = {
  place(
    center,
    dx: -249pt,
    dy: 158pt,
    text([#stren], size: 26pt)
  )
  place(
    center,
    dx: -249pt,
    dy: 229.6pt,
    text([#dex], size: 26pt)
  )
  place(
    center,
    dx: -249pt,
    dy: 301.2pt,
    text([#con], size: 26pt)
  )
  place(
    center,
    dx: -249pt,
    dy: 372.8pt,
    text([#intel], size: 26pt)
  )
  place(
    center,
    dx: -249pt,
    dy: 444.4pt,
    text([#wis], size: 26pt)
  )
  place(
    center,
    dx: -249pt,
    dy: 516pt,
    text([#cha], size: 26pt)
  )
}

#let print-mod-stats(
  stren: int, 
  dex: int,
  con: int,
  intel: int,
  wis: int,
  cha: int
) = {
  place(
    center,
    dx: -250pt,
    dy: 188pt,
    {
      if stren >= 0 {
        text([+#stren], size: 12pt)
      } else {
        text([#stren], size: 12pt)
      }
    }
  )
  place(
    center,
    dx: -250pt,
    dy: 259.6pt,
    {
      if dex >= 0 {
        text([+#dex], size: 12pt)
      } else {
        text([#dex], size: 12pt)
      }
    }
  )
  place(
    center,
    dx: -250pt,
    dy: 331.2pt,
    {
      if con >= 0 {
        text([+#con], size: 12pt)
      } else {
        text([#con], size: 12pt)
      }
    }
  )
  place(
    center,
    dx: -250pt,
    dy: 402.8pt,
    {
      if intel >= 0 {
        text([+#intel], size: 12pt)
      } else {
        text([#intel], size: 12pt)
      }
    }
  )
  place(
    center,
    dx: -250pt,
    dy: 474.4pt,
    {
      if wis >= 0 {
        text([+#wis], size: 12pt)
      } else {
        text([#wis], size: 12pt)
      }
    }
  )
  place(
    center,
    dx: -250pt,
    dy: 546pt,
    {
      if cha >= 0 {
        text([+#cha], size: 12pt)
      } else {
        text([#cha], size: 12pt)
      }
    }
  )
}

// Generates a character page
#let character-sheet(
  name: "", // name of the character
  paper-format: "letter", // supports a4 and letter, this will only have minor effect
  language: "en", // currently this only changes built-in typst localization, not the template-text
  body
) = {
  set text(lang: language, size:14pt, font: body-font)

  if paper-format == "letter" {
    set page(
      paper: "us-letter",
      margin: (x: 0%, y: 0%, top: 0%, bottom: 0%),
      background: image("page-1.svg", width: 100%)
    )
    place(
      top + left,
      dx: 52pt,
      dy: 65pt,
      text(name, size: 20pt)
    )
    body
  } else if paper-format == "a4" {
    set page(
      paper: "a4", 
      margin: (left: 0%, right: 0%, top: 0%, bottom: 0%),
      background: image("page-1.svg", width: 100%)
    )
    body
  }
}

#let character-stats(
/* * * HEADER * * */
  class: "", 
  subclass: "a", // may be displayed differently based on xp-type
  level: 1, 
  background: "",
  player: "", // name of the player
  species: "", // species (5e-2024) or race (5e-2014)
  alignment: "NN", // accepts a text or a code of format LG, NG, CG, LN, NN, CN, LE, NE, CE
  xp: 0, //may not be shown if xp-type is none
  xp-type: "xp", // supports xp, milestone, none

/* * * STATS * * */
  stren: 10, // can't call this str, since str is string
  dex: 10,
  con: 10,
  intel: 10, // can't call this int, since int is integer
  wis: 10,
  cha: 10,
  strenmod: 0, 
  dexmod: 0,
  conmod: 0,
  intelmod: 0,
  wismod: 0,
  chamod: 0,
  prof-bonus: 2,
) = {

print-header(class: class, subclass: subclass, level: level, background: background, player: player, species: species, alignment: alignment, xp: xp, xp-type: xp-type)

/* * * STATS * * */
print-base-stats(stren: stren, dex: dex, con: con, intel: intel, wis: wis, cha: cha)

strenmod = calculate_modifier(stat: stren) 
dexmod = calculate_modifier(stat: dex)
conmod = calculate_modifier(stat: con)
intelmod = calculate_modifier(stat: intel)
wismod = calculate_modifier(stat: wis)
chamod = calculate_modifier(stat: cha)

print-mod-stats(stren: strenmod, dex: dexmod, con: conmod, intel: intelmod, wis: wismod, cha: chamod)

prof-bonus = calc_proficiency_bonus(lvl: level)
place(
  top + left,
  dx: 97.5pt,
  dy: 169.5pt,
  text([+#prof-bonus], size: 18pt)
)

}


