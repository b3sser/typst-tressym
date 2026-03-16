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
  prof_bonus: 2,

/* * * SAVES * * */
  strensave: false,
  dexsave: false,
  consave: false,
  intelsave: false,
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
) = {
/* * * HEADER * * */
print-header(class: class, subclass: subclass, level: level, background: background, player: player, species: species, alignment: alignment, xp: xp, xp-type: xp-type)

/* * * STATS * * */
let stat_list = ( stren, dex, con, intel, wis, cha )
print-base-stats(stat_list)

strenmod = calculate_modifier(stat: stren) 
dexmod = calculate_modifier(stat: dex)
conmod = calculate_modifier(stat: con)
intelmod = calculate_modifier(stat: intel)
wismod = calculate_modifier(stat: wis)
chamod = calculate_modifier(stat: cha)

let statmod_list = ( strenmod, dexmod, conmod, intelmod, wismod, chamod )
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
let saves_list = ( strensave, dexsave, consave, intelsave, wissave, chasave )
// iterate over save list with calculation and printing
for i in range(6) {
  print-skill-mod(skill_prof: saves_list.at(i), stat: statmod_list.at(i), position: (i -8.6), prof_bonus: prof_bonus)
}

/* * * SKILLS * * */
// put all skills in an array
let skill_list = ( acrobatics,animal_handling,arcana,athletics,deception,history,insight,intimidation,investigation,medicine,nature,perception,performance,persuasion,religion,sleight_of_hand,stealth,survival )
// hardcode which stat corresponds to which skill
let skill_bases = ( dexmod,wismod,intelmod,strenmod,chamod,intelmod,wismod,chamod,intelmod,wismod,intelmod,wismod,chamod,chamod,intelmod,dexmod,dexmod,wismod )
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
}


