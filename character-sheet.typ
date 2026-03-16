#import "calculations.typ": *

#let body-font = "Vollkorn" // Suggested: Vollkorn, Kalam


/* * * HEADER * * */
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

/* * * STATS * * */
#let print-base-stats(
  stat_list
) = {
  let pos_y
  // calculate y coordinate based on position in list
  for i in range(6) {
    pos_y = 158pt + (71.6pt*i)
    place(
      center,
      dx: -249pt,
      dy: pos_y,
      text([#stat_list.at(i)], size: 26pt)
    )
  }
}

#let print-mod-stats(
  statmod_list
) = {
  let pos_y
  // calculate y coordinate based on position in list
  for i in range(6) {
    pos_y = 188pt + (71.6pt*i)
    place(
      center,
      dx: -250pt,
      dy: pos_y,
      {
        if statmod_list.at(i) >= 0 {
          text([+#statmod_list.at(i)], size: 12pt)
        } else {
          text([#statmod_list.at(i)], size: 12pt)
        }
      }
    )
  }
}

/* * * SKILLS * * */
#let print-skill-mod( skill_prof: bool, stat: int, position: int, prof_bonus: int) = {
  let skill_mod = stat
  let pos_y = 319.9pt + (13.5pt*position)
  // if proficient, add proficiency bonus and print dot
  if skill_prof {
    skill_mod = stat + prof_bonus

    place(
    center,
    dx: -201.7pt,
    dy: pos_y+4pt,
    circle(radius: 3pt, fill: black)
  )
  }
  // calculate y coordinate based on position in list
  place(
    center,
    dx: -187pt,
    dy: pos_y,
    {
      // add + sign if non-negative number
      if skill_mod >= 0 {
        text([+#skill_mod], size: 12pt)
      } else {
        text([#skill_mod], size: 12pt)
      }
    }
  )
}

// Generate character page
#let character-sheet(
  name: "", // name of the character
  language: "en", // currently this only changes built-in typst localization, not the template-text
  printer-mono: false, // whether colored or monochrome background is used
  body
) = {
  set text(lang: language, size:14pt, font: body-font)
  set page(
    paper: "us-letter",
    margin: (x: 0%, y: 0%, top: 0%, bottom: 0%)
  )
  if printer-mono {
    set page(
      background: image("page-1-mono.svg", width: 100%)
    )
    place(
      top + left,
      dx: 52pt,
      dy: 65pt,
      text(name, size: 20pt)
    )
    body
  } else {
    set page(
      background: image("page-1-col.svg", width: 100%)
    )
    place(
      top + left,
      dx: 52pt,
      dy: 65pt,
      text(name, size: 20pt)
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
  strength: 10, // can't call this str, since str is string
  dexterity: 10,
  constitution: 10,
  intelligence: 10, // can't call this int, since int is integer
  wisdom: 10,
  charisma: 10,
  strmod: 0, 
  dexmod: 0,
  conmod: 0,
  intmod: 0,
  wismod: 0,
  chamod: 0,
  prof_bonus: 2,

/* * * SAVES * * */
  strsave: false,
  dexsave: false,
  consave: false,
  intsave: false,
  wissave: false,
  chasave: false,

/* * * SKILLS * * */
  // half- and double-proficiencies are a planned future features
  acrobatics: false,
  animal_handling: false,
  arcana: false,
  athletics: false,
  deception: false,
  history: false,
  insight: false,
  intimidation: false,
  investigation: false,
  medicine: false,
  nature: false,
  perception: false,
  performance: false,
  persuasion: false,
  religion: false,
  sleight_of_hand: false,
  stealth: false,
  survival: false,

/* * * HEALTH * * */
  armorclass: none,
  initiative: none,
  speed: 30,
  hp-max: 0,
  hp-current: none,
  hp-temp: none,
  hitdice-total: none,
  hitdice-type: none,
  deathsave-s: 0,
  deathsave-f: 0,
) = {
/* * * HEADER * * */
print-header(class: class, subclass: subclass, level: level, background: background, player: player, species: species, alignment: alignment, xp: xp, xp-type: xp-type)

/* * * STATS * * */
let stat_list = ( strength, dexterity, constitution, intelligence, wisdom, charisma )
print-base-stats(stat_list)

strmod = calculate_modifier(stat: strength) 
dexmod = calculate_modifier(stat: dexterity)
conmod = calculate_modifier(stat: constitution)
intmod = calculate_modifier(stat: intelligence)
wismod = calculate_modifier(stat: wisdom)
chamod = calculate_modifier(stat: charisma)

let statmod_list = ( strmod, dexmod, conmod, intmod, wismod, chamod )
print-mod-stats(statmod_list)

prof_bonus = calc_proficiency_bonus(lvl: level)
place(
  top + left,
  dx: 97.5pt,
  dy: 169.5pt,
  text([+#prof_bonus], size: 18pt)
)

/* * * SAVES * * */
// put all saves in an array
let saves_list = ( strsave, dexsave, consave, intsave, wissave, chasave )
// iterate over save list with calculation and printing
for i in range(6) {
  print-skill-mod(skill_prof: saves_list.at(i), stat: statmod_list.at(i), position: (i -8.6), prof_bonus: prof_bonus)
}

/* * * SKILLS * * */
// put all skills in an array
let skill_list = ( acrobatics,animal_handling,arcana,athletics,deception,history,insight,intimidation,investigation,medicine,nature,perception,performance,persuasion,religion,sleight_of_hand,stealth,survival )
// hardcode which stat corresponds to which skill
let skill_bases = ( dexmod,wismod,intmod,strmod,chamod,intmod,wismod,chamod,intmod,wismod,intmod,wismod,chamod,chamod,intmod,dexmod,dexmod,wismod )
// iterate over skill list with calculation and printing
for i in range(18) {
  print-skill-mod(skill_prof: skill_list.at(i), stat: skill_bases.at(i), position: i, prof_bonus: prof_bonus)
}

// Calculate and print passive perception
let passive_perception = 10 + wismod
if perception {
  passive_perception = 10 + wismod + prof_bonus
}
place(
  center,
  dx: -264pt,
  dy: 592.5pt,
  text([#passive_perception], size: 17pt)
)

/* * * HEALTH * * */
if armorclass == none {
  armorclass = 10 + dexmod
}
place(
  center,
  dx: -58pt,
  dy: 146pt,
  text([#armorclass], size: 21pt)
)

if initiative == none {
  initiative = dexmod
}
place(
  center,
  dx: -4pt,
  dy: 146pt,
  {
    // add + sign if non-negative number
    if initiative >= 0 {
      text([+#initiative], size: 26pt)
    } else {
      text([#initiative], size: 26pt)
    }
  }
)

place(
  center,
  dx: 56.5pt,
  dy: 148pt,
  {text([#speed], size: 22pt)
  text([ft], size: 17pt)}
)

place(
  center,
  dx: -2pt,
  dy: 196pt,
  text([#hp-max], size: 14pt)
)
if hp-current != none {
  place(
    center,
    dx: -5pt,
    dy: 221.5pt,
    text([#hp-current], size: 14pt)
  )
}
if hp-temp != none {
  place(
    center,
    dx: -5pt,
    dy: 274pt,
    text([#hp-temp], size: 14pt)
  )
}
if hitdice-total == none {
  hitdice-total = level
}
place(
  center,
  dx: -43pt,
  dy: 319pt,
  text([#hitdice-total], size: 10pt)
)
place(
  center,
  dx: -43pt,
  dy: 337pt,
  text([#hitdice-type], size: 18pt)
)

for i in range(deathsave-s) {
  place(
    center,
    dx: 44.5pt + (12.85pt*i),
    dy: 323.3pt,
    circle(radius: 3.5pt, fill: black)
  )
}
for i in range(deathsave-f) {
  place(
    center,
    dx: 44.5pt + (12.85pt*i),
    dy: 338.3pt,
    circle(radius: 3.5pt, fill: black)
  )
}
}


