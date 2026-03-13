# MouseoverName

**MouseoverName** is a lightweight World of Warcraft addon that displays the name of the unit under your cursor. Player names are colored according to their class, while NPC names are colored based on their faction/reaction. The name follows your cursor and automatically hides when no unit is hovered over.  

---

## Features

- Displays only the **unit name** when hovering
- **Player names** colored by class
- **NPC names** colored by faction/reaction
- **Left-aligned text** that follows the cursor
- Font size set by default to **14**, adjustable ingame
- Auto-hides when not hovering a unit
- Minimalist and lightweight

---

## Customization

- Font size can be changed ingame via `/mon font <size>`.  
- To adjust cursor offset, edit `frame:SetPoint` in `MouseoverName.lua`:

```lua
frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", (x/scale)+20, (y/scale)+20)
