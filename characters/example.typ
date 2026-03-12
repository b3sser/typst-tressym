#import "../character-sheet.typ": *

#show: it => character-sheet(
  name: "Burami va'Rashir",
  language: "en",
  it
)

#character-stats(
/* * * HEADER * * */
  class: "Cleric", 
  subclass: "Life",
  level: 3, 
  background: "Journeyman",
  player: "Jo",
  species: "Leonin",
  alignment: "LN", // accepts text or a code of format LG, NG, CG, LN, NN, CN, LE, NE, CE
  xp: 0, 
  xp-type: "xp", // supports: xp, milestone, none (if none, space will be used by other fields)

/* * * STATS * * */
  stren: 10,
  dex: 10,
  con: 10,
  intel: 10,
  wis: 10,
  cha: 10,
)

#import "../characters/testpoints.typ": *
#testpoints()