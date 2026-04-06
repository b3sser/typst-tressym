# How to use Tressym

## New character
1. Make a copy of `example.typ`, `empty.typ` or `empty-mini.typ`.
    This can have any filename you'd like.
2. Edit the SETTINGS section to your liking
3. Fill the fields with your characters data
    - You may delete code lines for fields you'd like to leave blank / on their default value.
    - The `example.typ` and `empty.typ` files includes info on how to use each field and what input it expects in comments ("reading the code explains the code"). If you are a pro and would like a more lightweight sheet, choose `empty-mini.typ` instead.
    - Each page has its own block. You can render only select pages by deleting one of the blocks from your file.
4. Export to pdf (e.g. via tinymist or cmd)

## Customization
The template comes with various ways of altering a sheet, differing from the standard pdf character sheet. If you are unsure, just test each option in your preview.
- **Mono / Col:** `settings -> printer-mono` Pick between field outlines in standard black or in modern gold/brown
- **Spell Rainbows:** `settings -> spell-rainbows` Change the paper ruling of the spell sheet from black to rainbow gradients
- **Money Display:** `display-money` Show the standard boxes for each coin type or remove them, enlarging the space for Equipment text
- **Big Equipment:** `big-equip` Shrink the FEATURES & TRAITS box to instead enlarge the EQUIPMENT box to a two-column one (compatible with money display)
- **XP type:** `xp-type` Pick between "XP" and "MILESTONE" text in the header, or remove the XP field entirely (e.g. for a OneShot character), using the freed up space for an extra "SUBCLASS" field
- **Stat or Mod in Big Field?** `big-number-big-field` Choose whether Stats are printed in the big boxes and Modifiers in small ovals underneath, or the other way around
- **More Passive Stats:** `more-passive` If your table frequently uses Passive Checks for more than Perception, you can enable two extra fields that show Passive Insight and Passive Investigation

## Contribute
If you find bugs or have feature requests please submit an issue or pull request to [tressym's github repo](https://github.com/b3sser/typst-tressym).