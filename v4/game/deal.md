# Deal Instructions

## When to Deal
- User says "let's play dominoes"
- User types any domino notation (99, 64, 32, etc.)

## What to Do
1. Check if state.json exists
2. If not, shuffle complete double-9 set and deal properly
3. Sort user's tiles by strength before displaying
4. Show sorted tiles vertically in one row
5. No text, no explanation - just show tiles

## Tile Sorting Rules
1. Group tiles by matching numbers (8s, 9s, 5s, etc.)
2. Sort groups by size: biggest groups first
3. Within groups, sort tiles numerically
4. Show strongest groups first, singles last
5. Rotate tiles so matching numbers align when possible

## Shuffling Process
1. Create complete set: 00,01,02,03,04,05,06,07,08,09,11,12,13,14,15,16,17,18,19,22,23,24,25,26,27,28,29,33,34,35,36,37,38,39,44,45,46,47,48,49,55,56,57,58,59,66,67,68,69,77,78,79,88,89,99
2. Shuffle randomly
3. Deal 10 to user, 10 to ai1, 10 to ai2, 10 to ai3
4. Put remaining 15 in boneyard
5. Save to state.json

## Display Format
Show tiles vertically in one row - no labels, no numbers, just tiles:

```
┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐
│ ●   ● │ │ ●     │ │ ● ● ● │ │       │ │ ●   ● │ │ ●     │ │ ● ● ● │ │ ●   ● │ │ ●   ● │ │ ● ● ● │
│ ●   ● │ │   ●   │ │ ● ● ● │ │   ●   │ │ ●   ● │ │   ●   │ │ ● ● ● │ │       │ │ ●   ● │ │ ●   ● │
│ ●   ● │ │     ● │ │ ● ● ● │ │       │ │ ●   ● │ │     ● │ │ ● ● ● │ │ ●   ● │ │ ●   ● │ │ ● ● ● │
├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤ ├───────┤
│ ●   ● │ │ ●     │ │ ●   ● │ │       │ │ ●   ● │ │ ● ● ● │ │ ● ● ● │ │ ●   ● │ │ ●   ● │ │       │
│ ●   ● │ │       │ │ ●   ● │ │       │ │ ●   ● │ │ ● ● ● │ │ ● ● ● │ │       │ │ ●   ● │ │       │
│ ●   ● │ │     ● │ │ ●   ● │ │       │ │ ●   ● │ │ ● ● ● │ │ ● ● ● │ │ ●   ● │ │ ●   ● │ │       │
└───────┘ └───────┘ └───────┘ └───────┘ └───────┘ └───────┘ └───────┘ └───────┘ └───────┘ └───────┘
```

## Rules
- Each tile appears exactly once in the game
- Proper shuffling and dealing
- No labels or numbers on display
- Just ASCII art tiles
- User sees their tiles immediately