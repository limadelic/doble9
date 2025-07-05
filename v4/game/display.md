# Display

## Instructions
- Read user tiles from state/user.json
- Write ASCII domino tiles to OUT.md file
- Use tile.md vertical patterns
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