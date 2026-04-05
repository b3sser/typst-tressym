#import "@local/tressym-dnd:0.1.0": *
/* * * SETTINGS * * */
#let settings = (
  language: "en",
  printer-mono: false, // true: black, false: colored
  spell-rainbows: true,
  body-font: "Vollkorn"
)

#character-sheet(
  settings: settings,
  /* * * HEADER * * */
  name: "",
  class: "", 
  subclass: "",
  level: 1, 
  background: "",
  player: "",
  species: "",
  alignment: "", // text or code
  xp: 0, 
  xp-type: "xp", // xp, milestone, none

/* * * STATS * * */
  strength: 10,
  dexterity: 10,
  constitution: 10,
  intelligence: 10,
  wisdom: 10,
  charisma: 10,

/* * * SAVES * * */
  strsave: true,
  dexsave: true,
  consave: true,
  intsave: true,
  wissave: true,
  chasave: true,

/* * * SKILLS * * */
  acrobatics: true,
  animal_handling: true,
  arcana: true,
  athletics: true,
  deception: true,
  history: true,
  insight: true,
  intimidation: true,
  investigation: true,
  medicine: true,
  nature: true,
  perception: true,
  performance: true,
  persuasion: true,
  religion: true,
  sleight_of_hand: true,
  stealth: true,
  survival: true,

/* * * HEALTH * * */
  armorclass: none, // default = 10+Dex
  initiative: none, // default = Dex mod
  speed: 30, //default = 30ft
  hp-max: 0,
  hitdice-total: 0, // default = Level
  hitdice-type: "d",
  // hp-current, hp-temp, deathsave-s, deathsave-f

/* * * MISC * * */
  inspiration: "", // int or string


/* * * ATTACKS & SPELLCASTING * * */
  /*1: Name; string
    2: Attack Bonus; int OR "sp", "dp", "s", "d"
    3: Damage; text OR array (dice, type) in combo with 2 */
  weapons: (
  ("Weapon Name", 0, "1d6+1 slash." ),
  ),
  attacks_text: [
  ],

/* * * OTHER PROFICIENCIES & LANGUAGES * * */
  prof_lang_text: [
    #strong[Languages:] Common \
    #strong[Armor:] \
    #strong[Weapons:] \
    #strong[Tools:] 
  ],

/* * * EQUIPMENT * * */
  equipment_text: [
  ],
  display-money: true,
  money: (0,0,"-",0,0), // cp, sp, ep, gp, pp
  big-equip: true,

/* * * PERSONALITY * * */
  personality_traits: [],
  ideals: [],
  bonds: [],
  flaws: [],

/* * * FEATURES & TRAITS * * */
  features_traits: [
  ]
)

#details-sheet(
  settings: settings,
/* * * HEADER * * */
  name: "",
  age: "",
  height: ['" (cm)],
  weight: "lbs (kg)",
  eyes: "",
  skin: "",
  hair: "",
/* * * IMAGES * * */
  // paths relative to this file
  appearance: image("./img/person.png", width:162pt,height:220pt, fit: "contain"),
  symbol: image("./img/symbol.png", width:140.5pt,height:121pt, fit: "contain"),
  symbol-name: "",
/* * * TEXT FIELDS * * */
  backstory: [
  ],
  allies_organizations: [
  ],
  additional_features_traits: [
  ],
  treasure: [
  ],
)

#spell-sheet(
  settings: settings,
/* * * HEADER * * */
  spellcasting-class: "",
  spellcasting-ability: "",
  spell-save-dc: "", // string or int
  spell-attack-bonus: "", // string or int

/* * * SPELLS * * */
  // List of strings or (bool, str) pairs
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
  slots-expended: ()
)

/*
#set page(
  paper: "us-letter",
)
= Notes
*/