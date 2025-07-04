# Deal Instructions

## When to Deal
- User says "let's play dominoes"
- User types any domino notation (99, 64, 32, etc.)

## What to Do
1. Generate random 10 tiles for user
2. Display them in a clean row
3. Store remaining tiles for AI players and boneyard
4. No text, no explanation - just show tiles

## Display Format
Show user's tiles in a horizontal row:

```
┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐
│ ●   ● │ ●   ● │ │ ●     │ ●   ● │ │ ● ● ● │   ●   │ │ ●     │ ●   ● │ │ ● ● ● │ ● ● ● │
│ ●   ● │ ●   ● │ │   ●   │       │ │ ● ● ● │       │ │       │ ●   ● │ │ ● ● ● │ ● ● ● │
│ ●   ● │ ●   ● │ │     ● │     ● │ │ ● ● ● │     ● │ │     ● │ ●   ● │ │ ● ● ● │ ● ● ● │
└───────┴───────┘ └───────┴───────┘ └───────┴───────┘ └───────┴───────┘ └───────┴───────┘

┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐ ┌───────┬───────┐
│ ●   ● │ ●   ● │ │ ●     │       │ │ ●   ● │       │ │       │ ●     │ │ ●   ● │ ●   ● │
│       │ ●   ● │ │       │       │ │       │   ●   │ │   ●   │       │ │ ●   ● │       │
│ ●   ● │ ●   ● │ │     ● │       │ │ ●   ● │       │ │       │     ● │ │ ●   ● │ ●   ● │
└───────┴───────┘ └───────┴───────┘ └───────┴───────┘ └───────┴───────┘ └───────┴───────┘
```

## Double-9 Tile Set
Complete set: 00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 11, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 33, 34, 35, 36, 37, 38, 39, 44, 45, 46, 47, 48, 49, 55, 56, 57, 58, 59, 66, 67, 68, 69, 77, 78, 79, 88, 89, 99

Total: 55 tiles
- User gets 10
- AI players get 10 each (30 total)
- Boneyard gets 15

## Rules
- Each tile appears exactly once
- Randomly distribute
- No duplicates
- User sees their tiles immediately