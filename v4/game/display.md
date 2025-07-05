# Display

## Instructions
- Read user tiles from state/user.json
- For each tile (e.g. "03"), get patterns from numbers.json:
  - First digit = top pattern
  - Second digit = bottom pattern
- Build vertical domino with patterns from numbers.json
- Write ASCII domino tiles to OUT.md file
- All tiles in one row
- No labels or numbers
- Just ASCII art tiles
- Always write to the file, never show directly

## Postcondition
OUT.md contains exactly 10 ASCII domino tiles

## Example
For user tiles: ["05", "49", "55"]
Write this to OUT.md:
```
┌───────┐ ┌───────┐ ┌───────┐
│       │ │ ●   ● │ │ ●   ● │
│       │ │       │ │   ●   │
│       │ │ ●   ● │ │ ●   ● │
├───────┤ ├───────┤ ├───────┤
│ ●   ● │ │ ● ● ● │ │ ●   ● │
│   ●   │ │ ● ● ● │ │   ●   │
│ ●   ● │ │ ● ● ● │ │ ●   ● │
└───────┘ └───────┘ └───────┘
```