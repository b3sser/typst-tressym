#import "../tressym.typ": *

#character-sheet(
/* * * HEADER * * */
  name: "Person MacPersonface",
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
  dexterity: 12,
  constitution: 16,
  intelligence: 12,
  wisdom: 16,
  charisma: 8,

/* * * SAVES * * */
  // set all saving throws that your character is proficient in to true
  consave: true,
  chasave: true,

/* * * SKILLS * * */
  // set all skills that your character is proficient in to true
  // half- and double-proficiencies are a planned future feature
  athletics: true,
  insight: true,
  nature: true,
  persuasion: true,
  sleight_of_hand: true,

/* * * HEALTH * * */
  // "default" indicates what value this will be set to if the line is deleted from this file
  armorclass: 14, // default = 10+Dex (i.e. not wearing armor)
  initiative: 0, // default = Dex mod
  speed: 30, //default = 30ft
  hp-max: 40, // hp-current and hp-temp are available as well
  hitdice-total: 5, // default = Level
  hitdice-type: "d6",
  deathsave-s: 0, // successes; default = 0
  deathsave-f: 0, // failures; default = 0

/* * * MISC * * */
  inspiration: "1d4", // number or string

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
  ("Mace", "sp", ("1d6", "slash.")),
  ("Shortbow", 3, "1d6+1 pierc." ),
  ("Longbow", "d", "1d8+1 pierc."),
  ("Dagger", "dp", ("1d4", "pierc.")),
  ),
  // Freeform Text to display below weapons list
  attacks_text: [
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
  ],

/* * * OTHER PROFICIENCIES & LANGUAGES * * */
  prof_lang_text: [
    #strong[Languages:] Common \
    #strong[Armor:] light, medium, shields \
    #strong[Weapons:] simple \
    #strong[Tools:] Thieve's tools, Herbalism kit
  ],

/* * * EQUIPMENT * * */
  equipment_text: [
    Mace, Shortbow, Quiver (20 arrows) \
    Waterskin, Mess Kit, 10 rations \
    50ft Hempen Rope
  ],
  display_money: true, // true: display money boxes; false: no boxes; default: true
  money: (4,11,"-",29,0), // cp, sp, ep, gp, pp

/* * * PERSONALITY * * */
  personality_traits: [I take great pains to always look my best and follow the latest fashions.],
  ideals: [#strong[Knowledge.] Knowledge is power, and knowing which horse to back is the key to success.],
  bonds: [Growing up, I had an imaginary friend I could always count on. That friend is still with me. ],
  flaws: [I don't know when to quit. Especially when everyone else is telling me to.],

/* * * FEATURES & TRAITS * * */
  features_traits: [Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.]
)

#details-sheet(
  // Everything for this page is a string.
  // Use "" or [] as you like, [] will be needed for things like #strong to work
/* * * HEADER * * */
  name: "Person MacPersonface", // Yes, you have to enter it again, sorry
  age: "24 years",
  height: [6'9½" (207cm)],
  weight: "258lbs (117kg)",
  eyes: "golden",
  skin: "blue",
  hair: "long wavy white",
/* * * IMAGES * * */
  appearance: "/characters/img/person.png",
  symbol: "/characters/img/symbol.png",
  symbol-name: "Symbol of the Direction Club",
/* * * TEXT FIELDS * * */
  backstory: [
    #lorem(164)],
  allies_organizations: [
    #lorem(100)],
  additional_features_traits: [
    #lorem(170)],
  treasure: [
    #lorem(130)],
)

#spell-sheet(
/* * * HEADER * * */
  spellcasting-class: "Magician",
  spellcasting-ability: "Charisma",
  spell-save-dc: 18, // String or Int
  spell-attack-bonus: "+3", // String or Int, Int automatically adds "+"

/* * * SPELLS * * */
  /* In the () for the appropiate level, place a list of spells.
  The spell list for each level is sized automatically.
  If you'd like a line with no text to be printed, add "",
  When you leave a () empty or delete the line, no header for that spell level will be printed. */ 
  cantrips: ("Dancing Lights", "Shillelagh", "Vicious Mockery"),
  lvl1_spells: ("Absorb Elements", "Aid", "Alarm", "Animal Friendship", "Animal Messenger", "Barkskin", "Beast Bond", "Beast Sense", "Commune with Nature", "Conjure Animals", "Conjure Barrage", "Conjure Volley", "Conjure Woodland Beings", "Cordon of Arrows", "Cure Wounds", "Darkvision", "Daylight", "Detect Magic", "Detect Poison and Disease"),
  lvl2_spells: ("Dominate Beast", "Elemental Weapon", "Enhance Ability", "Ensnaring Strike", "Entangle", "Find Traps", "Flame Arrows", "Fog Cloud", "Freedom of Movement", "Goodberry", "Grasping Vine", "Greater Restoration", "Guardian of Nature", "Gust of Wind", "Hail of Thorns", "Healing Spirit", "Hunter's Mark", "Jump", "Lesser Restoration"),
  lvl3_spells: ("Lightning Arrow", "Locate Animals or Plants", "Locate Creature", "Locate Object", "Longstrider", "Magic Weapon", "Meld into Stone", "Nondetection", "Pass without Trace", "Plant Growth", "Protection from Energy", "Protection from Poison", "Revivify", "Searing Smite", "Silence", "Snare"),
  lvl4_spells: ("Speak with Animals", "Speak with Plants", "Spike Growth", "Steel Wind Strike", "Stoneskin", "Summon Beast", "Summon Elemental", "Summon Fey"),
  lvl5_spells: ("Swift Quiver", "Tree Stride", "Water Breathing", "Water Walk", "Wind Wall", "Wrath of Nature", "Zephyr Strike"),
  lvl6_spells: ("Tasha's Otherworldly Guys", "Otto's Irresistible Dance"),
  lvl7_spells: ("Mordenkainens Funny Hideout", "Reverse Gravy"),
  lvl8_spells: ("Abi-Dalzim's Horrid Quilting", "Glibness"),
  lvl9_spells: ("Glade of Disaster", "Power Word Feel", "Weird"),

  /* * * SPELL SLOTS * * */
  // enter the number of total/expended slots in order of spell level, adding a 0 to skip a level
  slots-total: (4,3,3,3,3,2,2,1,1),
  slots-expended: (1,2,3,0,0,1)
  // Troubleshooting: Please note that if you want to add slot numbers for level 1 only, you still need to add a , after your number, else it will not work.
)

= Notes
Wanna keep your notes here?
== Test 
= Test