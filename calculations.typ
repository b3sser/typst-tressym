/* * * HEADER * * */
// Format alignment code to long form
#let alignment_long(code: str) = {
  if code == "LG" {return "Lawful Good"}
  else if code == "NG" {return "Neutral Good"}
  else if code == "CG" {return "Chaotic Good"}
  else if code == "LN" {return "Lawful Neutral"}
  else if code == "NG" {return "True Neutral"}
  else if code == "CG" {return "Chaotic Neutral"}
  else if code == "LN" {return "Lawful Evil"}
  else if code == "NG" {return "Neutral Evil"}
  else if code == "CG" {return "Chaotic Evil"}
  else {return code}
}

/* * * STATS * * */
#let calculate_modifier(stat: int)  = {
  return calc.floor((stat -10)/2)
}

#let calc_proficiency_bonus(lvl: int) = {
  if lvl <= 4 { return 2 }
  else if 5 <= lvl and lvl <= 8 { return 3 }
  else if 9 <= lvl and lvl <= 12 { return 4 }
  else if 13 <= lvl and lvl <= 16 { return 5 }
  else if 17 <= lvl { return 6 }
}