# Tressym
## Render D&D 5e Character Sheets with auto-calculation

### Features
- 3-page character sheet for 5th edition 2014 D&D
- Character Sheet
    - automatically calculate proficiency bonus, stat modifiers, skill modifiers and more
    - support double and half proficiencies (Expertise, Jack of All Trades, ...)
- Character Details Sheet
    - include images and fit them to the sheet boxes
    - multi-column boxes for text
- Spell Sheet
    - automatically size sections for each spell level, allowing the user to add more spells than the static original sheet
    - optional: mark spells as prepared and track expended spell slots
- Various Customization Options (read below)

#### Customization
The template comes with various ways of altering a sheet, differing from the standard pdf character sheet. If you are unsure, just test each option in your preview.
- **Mono / Col:** Pick between field outlines in standard black or in modern gold/brown
- **Spell Rainbows:** Change the paper ruling of the spell sheet from black to rainbow gradients
- **Money Display:** Show the standard boxes for each coin type or remove them, enlarging the space for Equipment text
- **Big Equipment:** Shrink the FEATURES & TRAITS box to instead enlarge the EQUIPMENT box to a two-column one (compatible with money display)
- **XP type:** Pick between "XP" and "MILESTONE" text in the header, or remove the XP field entirely (e.g. for a OneShot character), using the freed up space for an extra "SUBCLASS" field
- **Stat or Mod in Big Field?** Choose whether Stats are printed in the big boxes and Modifiers in small ovals underneath, or the other way around
- **More Passive Stats:** If your table frequently uses Passive Checks for more than Perception, you can enable two extra fields that show Passive Insight and Passive Investigation

#### Planned Features / Roadmap
- Further Customization Options, Alternate or Reduced Sheets (gradually over multiple versions)
- Option to overwrite any and all auto-calculated stats on the user end (planned for 0.2.2)
- Support for A4-Paper (maybe)
- 2024 Sheet (maybe)
- pdf interactions (maybe)

### Example:
![three pages of a finished character sheet for Person MacPersonface](example.png)

### Installation
**From Typst Universe** (recommended):
```typst init @preview/tressym-dnd```

**From Github:**
- Clone the repo to your local typst package directory as explained [here](https://github.com/typst/packages/blob/main/README.md#local-packages)
- Run `typst init @local/tressym-dnd`
- Change `#import "@preview/tressym-dnd:0.2.1": *` to `#import "@local/tressym-dnd:0.2.1": *` at the beginning of your character file

OR

- Clone the repo to local directory of your choosing
- Change `#import "@preview/tressym-dnd:0.2.1": *` to `#import "../tressym.typ": *` at the beginning of your character file

### Usage
1. Make a copy of `example.typ`, `empty.typ` or `empty-mini.typ`.
    This can have any filename you'd like.
2. Edit the SETTINGS section to your liking
3. Fill the fields with your characters data
    - You may delete code lines for fields you'd like to leave blank / on their default value.
    - The `example.typ` and `empty.typ` files includes info on how to use each field and what input it expects in comments ("reading the code explains the code"). If you are a pro and would like a more lightweight sheet, choose `empty-mini.typ` instead.
    - Each page has its own block. You can render only select pages by deleting one of the blocks from your file.
4. Export to pdf (e.g. via tinymist or cmd)

### Contribute
If you find bugs or have feature requests please submit an issue or pull request to [tressym's github repo](https://github.com/b3sser/typst-tressym).

### Credits & Licensing
- This package was inspired by the LaTeX DnD 5e Character Sheet by [matsavage](https://github.com/matsavage/DND-5e-LaTeX-Character-Sheet-Template).
- The game Dungeons&Dragons and the layout of the character sheet belong to Wizards of the Coast.
    - This template is a fan project and not officialy endorsed by WotC. It was made with regard to the Fan Content Policy.
    - All mechanics implemented in the auto-calculation of this template are part of the System Reference Document v5.1 and therefor used under Creative Commons Licensing.
    - Names of Spells, Classes, Species in the example document are being used as per the Fan Contect Policy.
    - No specific class mechanics, spell descriptions, stat blocks, etc. are being published.
    - This template is and always will be available for free.
- This template is strictly intended for personal, non-commercial use.
