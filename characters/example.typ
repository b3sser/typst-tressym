#import "../character-sheet.typ": *

#show: it => character-sheet(
  name: "Person MacPersonface",
  language: "en",
  printer-mono: false, // true for black outlines, false for colored
  it
)

#character-stats(
/* * * HEADER * * */
  class: "Cleric", 
  subclass: "Life",
  level: 3, 
  background: "Journeyman",
  player: "Person",
  species: "Leonin",
  alignment: "LN", // accepts text or a code of format LG, NG, CG, LN, NN, CN, LE, NE, CE
  xp: 0, 
  xp-type: "xp", // supports: xp, milestone, none (if none, space will be used by other fields)

/* * * STATS * * */
  // The sheet is currently big-number-big-field. A switch to put the modifiers in big fields and stats in small fields is a planned future feature.
  strength: 12,
  dexterity: 8,
  constitution: 16,
  intelligence: 12,
  wisdom: 16,
  charisma: 10,

/* * * SAVES * * */
  // set all saving throws that your character is proficient in to true, all others can be left out to keep the file clean
  consave: true,
  chasave: true,

/* * * SKILLS * * */
  // set all skills that your character is proficient in to true, all others can be left out to keep the file clean
  // half- and double-proficiencies are a planned future feature
  athletics: true,
  insight: true,
  nature: true,
  persuasion: true,
  sleight_of_hand: true,

/* * * HEALTH * * */
// "default" indicates what value this will be set to if the line is deleted in this file
  armorclass: 14, // default = 10+Dex (i.e. not wearing armor)
  initiative: 0, // default = Dex mod
  speed: 30, //default = 30ft
  hp-max: 40, // hp-current and hp-temp are available as well
  hitdice-total: 5, // default = Level
  hitdice-type: "d6",
  deathsave-s: 0, // successes; default = 0
  deathsave-f: 0, // failures; default = 0
)

#import "../characters/testpoints.typ": *
#testpoints()