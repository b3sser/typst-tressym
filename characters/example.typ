#import "../character-sheet.typ": *

#show: it => character-sheet(
  name: "Person MacPersonface",
  language: "en",
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
)

#import "../characters/testpoints.typ": *
#testpoints()