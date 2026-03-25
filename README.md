# Tressym
## Render D&D 5e Character Sheets with auto-calculation

### Features
- 3-page character sheet for 5th edition 2014 D&D
- Character Sheet
    - automatically calculate proficiency bonus, stat modifiers, skill modifiers and more
    - choose whether to display money fields
- Character Details Sheet
    - include images and fit them to the sheet boxes
    - multi-column boxes for text
- Spell Sheet
    - automatically size sections for each spell level, allowing the user to add more spells than the static original sheet
    - enable `spell-rainbows` in `settings.typ` for added visual fun
- Choose between classic black outlines or decorative golden and brown outlines via `settings.typ`

#### Planned Features / Roadmap
- Support for double proficiency (expertise, etc.), half-proficiency, etc. (definitely in 0.2.0)
- Allow the user to easily switch whether modifiers or stats go in the big fields (definitely in 0.2.0 or 0.3.0)
- spell preparation circles fillable (0.1.1)
- Alternate and Reduced Sheets
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
- Change `#import "@preview/tressym-dnd:0.1.0": *` to `#import "@local/tressym-dnd:0.1.0": *` at the beginning of your character file

OR

- Clone the repo to local directory of your choosing
- Change `#import "@preview/tressym-dnd:0.1.0": *` to `#import "../tressym.typ": *` at the beginning of your character file

### Usage
1. Edit `settings.typ` to your liking
2. Make a copy of `example.typ` or `empty.typ`.
    This can have any filename you'd like.
3. Fill the fields with your characters data
    - You may delete code lines for fields you'd like to leave blank / on their default value.
    - The `example.typ` and `empty.typ` files includes info on how to use each field and what input it expects in comments.
    - Each page has its own block. You can render only select pages by deleting one of the blocks from your file.
4. Export to pdf

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