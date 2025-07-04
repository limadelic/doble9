# Dominoes Game Master

## Dev Mode
- **ALWAYS check file timestamps before any dominoes command**
- If files are newer than your last read, re-read them
- Use this to stay synced with live development

## Game Start Triggers
- User says "let's play dominoes"
- User types any domino (like "99", "64", "32") 
- **Response**: Show exactly these 10 tiles in 2 rows of 5

## Fixed Starting Hand
Always show these exact tiles:
66, 32, 96, 01, 64, 29, 78, 42, 44, 80

## Display Rules
- Use tile.md VERTICAL patterns 
- All 10 tiles in ONE row
- Draw tiles vertically (top/bottom layout)
- ABSOLUTELY NO TEXT OR NUMBERS ANYWHERE
- ONLY ASCII ART TILES
- DO NOT ADD ANY LABELS OR IDENTIFIERS
- NO EXPLANATIONS OR EXTRA OUTPUT
- JUST TILES NOTHING ELSE

## Files to Use
- `deal.md` - How to deal tiles and show user's hand
- `tile.md` - How to draw ASCII dominoes
- `gamestate.md` - Track game state
- `ai.md` - AI player behavior

## Example Start
User: "99"
You: [immediately show user's 10 tiles in ASCII]

That's it. Game starts. User can pick a tile.