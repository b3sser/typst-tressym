/* * * CALCULATIONS * * */
// Format alignment code to long form
#let alignment-long(code: str) = {
  if code == "LG" {return "Lawful Good"}
  else if code == "NG" {return "Neutral Good"}
  else if code == "CG" {return "Chaotic Good"}
  else if code == "LN" {return "Lawful Neutral"}
  else if code == "NN" {return "True Neutral"}
  else if code == "CN" {return "Chaotic Neutral"}
  else if code == "LE" {return "Lawful Evil"}
  else if code == "NE" {return "Neutral Evil"}
  else if code == "CE" {return "Chaotic Evil"}
  else {return code}
}

#let calculate-modifier(stat: int)  = {
  return calc.floor((stat -10)/2)
}

#let calc-proficiency-bonus(lvl: int) = {
  if lvl <= 4 { return 2 }
  else if 5 <= lvl and lvl <= 8 { return 3 }
  else if 9 <= lvl and lvl <= 12 { return 4 }
  else if 13 <= lvl and lvl <= 16 { return 5 }
  else if 17 <= lvl { return 6 }
}

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
    alignment-long(code: alignment)
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
      dy: 51pt,
      [#class #h(10pt) #level]
    )
    place(
      top + left,
      dx: 381pt,
      dy: 51pt,
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
      dy: 51pt,
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
        dy: 51pt,
        if subclass == "" {
          [#class #h(8pt) #level]
        } else {
          [#class (#subclass) #level]
        }
      )

    place(
      top + left,
      dx: 381pt,
      dy: 51pt,
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
      dy: 51pt,
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
  stat-list
) = {
  let pos_y
  // calculate y coordinate based on position in list
  for i in range(6) {
    pos_y = 158pt + (71.6pt*i)
    place(
      center,
      dx: -249pt,
      dy: pos_y,
      text([#stat-list.at(i)], size: 26pt)
    )
  }
}

#let print-mod-stats(
  statmod-list
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
        // add + sign if non-negative number
        if statmod-list.at(i) >= 0 {
          text([+#statmod-list.at(i)], size: 12pt)
        } else {
          text([#statmod-list.at(i)], size: 12pt)
        }
      }
    )
  }
}

/* * * SKILLS & SAVES* * */
#let print-skill-mod( skill-prof: bool, stat: int, position: int, prof-bonus: int) = {
  let skill_mod = stat
  let pos_y = 319.9pt + (13.5pt*position)
  // if proficient, add proficiency bonus and print dot
  if skill-prof {
    skill_mod = stat + prof-bonus

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

/* * * ATTACKS & SPELLCASTING * * */
#let add_weapon(
  name,
  atk-bonus,
  damage,
  position
) = {
  place(
    top + left,
    dx: 225.3pt,
    dy: 392.2pt + (20.5pt*position),
    polygon(
      fill: gray.lighten(70%),
      stroke: none,
      (-2.3pt, 15.7pt),
      (-2.3pt, 2.3pt),
      (0pt, 0pt),
      (61.6pt, 0pt),
      (61.6pt, 13.4pt),
      (59.3pt, 15.7pt)
    )
  )
  place(
    top + left,
    dx: 224pt,
    dy: 396pt + (20.5pt*position),
    text(name, size: 10pt)
  )
  place(
    top + left,
    dx: 293.75pt,
    dy: 392.2pt + (20.5pt*position),
    polygon(
      fill: gray.lighten(70%),
      stroke: none,
      (-2.3pt, 15.7pt),
      (-2.3pt, 2.3pt),
      (0pt, 0pt),
      (28.65pt, 0pt),
      (28.65pt, 13.4pt),
      (26.35pt, 15.7pt)
    )
  )
  place(
    center,
    dx: -1.5pt,
    dy: 395pt + (20.5pt*position),
    { // add + sign if non-negative number
      if type(atk-bonus) == int and atk-bonus >= 0 {
        text([+#atk-bonus], size: 12pt)
      } else { text([#atk-bonus], size: 12pt) }
    }
  )
  place(
    top + left,
    dx: 329.45pt,
    dy: 392.2pt + (20.5pt*position),
    polygon(
      fill: gray.lighten(70%),
      stroke: none,
      (-2.3pt, 15.7pt),
      (-2.3pt, 2.3pt),
      (0pt, 0pt),
      (59.6pt, 0pt),
      (59.6pt, 13.4pt),
      (57.3pt, 15.7pt)
    )
  )
  if type(damage) == str {
    place(
      top + left,
      dx: 330pt,
      dy: 396.5pt + (20.5pt*position),
      text(damage, size: 10pt)
    )
  } else {
    place(
      top + left,
      dx: 330pt,
      dy: 396.5pt + (20.5pt*position),
      {text(damage.at(0), size: 10pt)
      { // add + sign if non-negative number
        if type(damage.at(1)) == int and damage.at(1) >= 0 { text([+#damage.at(1) ], size: 10pt)
        } else { text([#damage.at(1) ], size: 10pt)}
      }
      text(damage.at(2), size: 10pt)}
    )
  }
}

// Generate character page
#let character-sheet(
/* * * HEADER * * */
  name: "", // name of the character
  class: "", 
  subclass: "", // may be displayed differently based on xp-type
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
  prof-bonus: 2,

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

/* * * MISC * * */
  inspiration: none,

/* * * ATTACKS & SPELLCASTING * * */
  weapons: (),
  attacks_text: str,
/* * * OTHER PROFICIENCIES & LANGUAGES * * */
  prof_lang_text: str,
/* * * EQUIPMENT * * */
  equipment_text: str,
  display_money: true,
  money: (none,none,none,none,none),
/* * * PERSONALITY * * */
  personality_traits: str,
  ideals: str,
  bonds: str,
  flaws: str,
/* * * FEATURES & TRAITS * * */
  features_traits: str,
/* * * for rendering * * */
  settings: (
    language: "en", // only changes built-in lang features, no changes are made to the sheet text
    printer-mono: true, // true for black outlines, false for colored
    spell-rainbows: true, // changes the paper rules to rainbow gradients
    body-font: "Vollkorn"
  ),
  body: none
) = {
  set text(lang: settings.at("language"), size:13pt, font: settings.at("body-font"))
  set page(
    paper: "us-letter",
    margin: (x: 0%, y: 0%, top: 0%, bottom: 0%)
  )
  
  body = {
  /* * * HEADER * * */
  print-header(class: class, subclass: subclass, level: level, background: background, player: player, species: species, alignment: alignment, xp: xp, xp-type: xp-type)

  /* * * STATS * * */
  let stat-list = ( strength, dexterity, constitution, intelligence, wisdom, charisma )
  print-base-stats(stat-list)

  strmod = calculate-modifier(stat: strength) 
  dexmod = calculate-modifier(stat: dexterity)
  conmod = calculate-modifier(stat: constitution)
  intmod = calculate-modifier(stat: intelligence)
  wismod = calculate-modifier(stat: wisdom)
  chamod = calculate-modifier(stat: charisma)

  let statmod-list = ( strmod, dexmod, conmod, intmod, wismod, chamod )
  print-mod-stats(statmod-list)

  prof-bonus = calc-proficiency-bonus(lvl: level)
  place(
    top + left,
    dx: 97.5pt,
    dy: 169.5pt,
    text([+#prof-bonus], size: 18pt)
  )

  /* * * SAVES * * */
  // put all saves in an array
  let saves_list = ( strsave, dexsave, consave, intsave, wissave, chasave )
  // iterate over save list with calculation and printing
  for i in range(6) {
    print-skill-mod(skill-prof: saves_list.at(i), stat: statmod-list.at(i), position: (i -8.6), prof-bonus: prof-bonus)
  }

  /* * * SKILLS * * */
  // put all skills in an array
  let skill_list = ( acrobatics,animal_handling,arcana,athletics,deception,history,insight,intimidation,investigation,medicine,nature,perception,performance,persuasion,religion,sleight_of_hand,stealth,survival )
  // hardcode which stat corresponds to which skill
  let skill_bases = ( dexmod,wismod,intmod,strmod,chamod,intmod,wismod,chamod,intmod,wismod,intmod,wismod,chamod,chamod,intmod,dexmod,dexmod,wismod )
  // iterate over skill list with calculation and printing
  for i in range(18) {
    print-skill-mod(skill-prof: skill_list.at(i), stat: skill_bases.at(i), position: i, prof-bonus: prof-bonus)
  }

  // Calculate and print passive perception
  let passive_perception = 10 + wismod
  if perception {
    passive_perception = 10 + wismod + prof-bonus
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

  /* * * MISC * * */
  place(
    center,
    dx: -198.5pt,
    dy: 134.5pt,
    text([#inspiration], size: 13pt)
  )

  /* * * ATTACKS & SPELLCASTING * * */
  let weaponnr = 0
  for weapon in weapons {
    if type(weapon.at(2)) != str {
      if type(weapon.at(1)) == int {
        weapon.at(2) = (weapon.at(2).at(0),weapon.at(1),weapon.at(2).at(1))
      } else if weapon.at(1) == "sp" or weapon.at(1) == "s" {
        weapon.at(2) = (weapon.at(2).at(0),strmod,weapon.at(2).at(1))
      } else if weapon.at(1) == "dp" or weapon.at(1) == "d" {
        weapon.at(2) = (weapon.at(2).at(0),dexmod,weapon.at(2).at(1))
      } else {
        atk = ""
      }
    }
    let atk
    if type(weapon.at(1)) == int {
      atk = weapon.at(1)
    } else if weapon.at(1) == "sp" {
      atk = strmod + prof-bonus
    } else if weapon.at(1) == "dp" {
      atk = dexmod + prof-bonus
    } else if weapon.at(1) == "s" {
      atk = strmod
    } else if weapon.at(1) == "d" {
      atk = dexmod
    } else {
      atk = weapon.at(1)
    }
    add_weapon(weapon.at(0),atk,weapon.at(2), weaponnr)
    weaponnr += 1
  }
  // Display Attacks & Spellcasting Text below Weapons Table
  place(
    top + left,
    dx: 224pt,
    dy: 396pt + (20.5pt*weaponnr),
    block(width: 163pt,par(justify: true, leading:3.5pt, text(attacks_text, size: 10pt)))
  )

  /* * * OTHER PROFICIENCIES & LANGUAGES * * */
  place(
    top + left,
    dx: 35.2pt,
    dy: 629pt,
    block(width: 163pt,par(justify: true, leading:5.5pt, text(prof_lang_text, size: 10pt)))
  )

  /* * * EQUIPMENT * * */
  let equip_x = 0pt
  if display_money {
    equip_x = 45pt
    if settings.at("printer-mono") {
      place(
        top + left,
        dx: 211.35pt,
        dy: 596.45pt,
        image("/outlines/money-mono.svg")
      )
    } else {
      place(
        top + left,
        dx: 211.35pt,
        dy: 596.45pt,
        image("/outlines/money-col.svg")
      )
    }
    for i in range(5) {
      place(
        center,
        dx: -62.5pt,
        dy: 599.5pt + i*26.3pt,
        text([#money.at(i)], size: 18pt)
      )
    }
  }
  place(
    top + left,
    dx: 223.5pt + equip_x,
    dy: 595pt,
    block(width: 163pt-equip_x,par(justify: true, leading:4.5pt, text(equipment_text, size: 10pt)))
  )

  /* * * PERSONALITY * * */
  place(
    top + left,
    dx: 418pt,
    dy: 142pt,
    block(width: 153pt,par(justify: true, leading:4.5pt, text(personality_traits, size: 9pt)))
  )
  let personality = (ideals, bonds, flaws)
  for i in range(3) { 
    place(
      top + left,
      dx: 418pt,
      dy: 210.5pt + i*55.5pt,
      block(width: 153pt,par(justify: true, leading:4.5pt, text(personality.at(i), size: 9pt)))
    )
  }

  /* * * FEATURES & TRAITS * * */
  place(
    top + left,
    dx: 412pt,
    dy: 387pt,
    block(width: 164pt,par(justify: true, leading:5pt, text(features_traits, size: 10pt)))
  )
  }

  // Place Background and all info added to body above
  if settings.at("printer-mono") {
    set page(
      background: image("/outlines/page-1-mono.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 65pt,
      text(name, size: 20pt)
    )
    body
  } else {
    set page(
      background: image("/outlines/page-1-col.svg", width: 100%)
    )
    place(
      top + left,
      dx: 51pt,
      dy: 65pt,
      text(name, size: 20pt)
    )
    body
  }
}


