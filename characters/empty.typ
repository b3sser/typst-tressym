#import "@local/tressym-dnd:0.1.0": *
/* * * SETTINGS * * */
#let settings = (
  language: "en", // only changes built-in lang features, no changes are made to the sheet text
  printer-mono: false, // true for black outlines, false for colored
  spell-rainbows: true, // changes the paper rules of the spell list to rainbow gradients
  body-font: "Vollkorn" // The spacing, leading, font sizes and placing in this template were optimized for Vollkorn font. You may of course experiment with different fonts if you like, a popular choice for character sheets is e.g. Kalam.
)

#character-sheet(
  settings: settings,
  /* * * HEADER * * */
  name: "", // name of the character
  class: "", 
  subclass: "",
  level: 1, 
  background: "",
  player: "", // name of the player
  species: "", // species (5e-2024) or race (5e-2014)
  alignment: "", // accepts text or a code of format LG, NG, CG, LN, NN, CN, LE, NE, CE
  xp: 0, 
  xp-type: "xp", // supports: xp, milestone, none (if none, space will be used by other fields)

/* * * STATS * * */
  // The sheet is currently big-number-big-field. A switch to put the modifiers in big fields and stats in small fields is a planned future feature.
  strength: 10,
  dexterity: 10,
  constitution: 10,
  intelligence: 10,
  wisdom: 10,
  charisma: 10,

/* * * SAVES * * */
  // set all saving throws that your character is proficient in to true
  // you may delete any lines that are set to "false"
  strsave: true,
  dexsave: true,
  consave: true,
  intsave: true,
  wissave: true,
  chasave: true,

/* * * SKILLS * * */
  // set all skills that your character is proficient in to true
  // you may delete any lines that are set to "false"
  // half- and double-proficiencies are a planned future feature
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
  // "default" indicates what value this will be set to if the line is deleted from this file
  armorclass: none, // default = 10+Dex (i.e. not wearing armor)
  initiative: none, // default = Dex mod
  speed: 30, //default = 30ft
  hp-max: 0, // hp-current and hp-temp are available as well
  hitdice-total: 0, // default = Level
  hitdice-type: "d",
  deathsave-s: 0, // successes; default = 0
  deathsave-f: 0, // failures; default = 0

/* * * MISC * * */
  inspiration: "", // number or string


/* * * ATTACKS & SPELLCASTING * * */
  /*
  + You may add as many weapons as the paper fits.
  + Field 1: Name (string)
  + Field 2: Attack Bonus; can be either a number
    OR "sp", "dp", "s" or "d" to indicate whether to use Strength or Dexterity and whether you are proficient in this weapon. This way the numbers update automatically on level up.
  + Field 3: Damage; can be either a freeform text
    OR an array of form (dice, type), e.g. ("1d4", "slash")
    -> the latter only works in combo with the "sp", etc. from above
  */
  weapons: (
  ("Weapon Name", 0, "1d6+1 slash." ),
  ),
  attacks_text: [
    // Freeform Text to display below weapons list
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
  display_money: true, // true: display money boxes; false: no boxes; default: true
  money: (0,0,"-",0,0), // cp, sp, ep, gp, pp
  big_equip: true, // Gives you a bigger equipment box with two columns, making the Features & Traits box smaller in exchange

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
  // Everything for this page is a string.
  // Use "" or [] as you like, [] will be needed for things like #strong to work
/* * * HEADER * * */
  name: "", // Yes, you have to enter it again, sorry
  age: "",
  height: ['" (cm)],
  weight: "lbs (kg)",
  eyes: "",
  skin: "",
  hair: "",
/* * * IMAGES * * */
  // Image paths are relative to this file
  // If you leave the other options as they are, the image will be fitted to the boxes on the sheet without distortion
  appearance: image("./img/person.png", width:162pt,height:220pt, fit: "contain"),
  symbol: image("./img/symbol.png", width:140.5pt,height:121pt, fit: "contain"),
  symbol-name: "Symbol of the Direction Club",
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
  spell-save-dc: "", // String or Int
  spell-attack-bonus: "", // String or Int, Int automatically adds "+"

/* * * SPELLS * * */
  /* In the () for the appropiate level, place a list of spells.
  The spell list for each level is sized automatically.
  If you'd like a line with no text to be printed, add "",
  When you leave a () empty or delete the line, no header for that spell level will be printed. */ 
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
  // enter the number of total/expended slots in order of spell level, adding a 0 to skip a level
  slots-total: (),
  slots-expended: ()
  // Troubleshooting: Please note that if you want to add slot numbers for level 1 only, you still need to add a , after your number, else it will not work.
)

// If you'd like, you can continue with a normal document before, after or inbetween the character sheet!
/*
#set page(
  paper: "us-letter",
)
= Notes
My character is very cool!
== Backstory
They grew up in a village with many cats and liked to drink applejuice as a kid.
*/