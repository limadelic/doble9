# Game State Management

## State File: state.json
Track the current game state in a JSON file.

## Game Start Process
1. Create complete double-9 tile set (55 tiles)
2. Shuffle randomly
3. Deal 10 to each player (user + 3 AI)
4. Put remaining 15 in boneyard
5. Save state to state.json

## State Structure
```json
{
  "players": {
    "user": ["66", "32", "96", "01", "64", "29", "78", "42", "44", "80"],
    "ai1": ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden"],
    "ai2": ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden"],
    "ai3": ["hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden", "hidden"]
  },
  "boneyard": ["12", "34", "56", "..."],
  "table": [],
  "turn": "user",
  "game_id": "unique_id"
}
```

## Rules
- Each tile appears exactly once across all players + boneyard
- User tiles are visible, AI tiles are hidden
- State persists between commands
- Always read state.json first before any game action
- Update state.json after any move

## On Game Start
1. Check if state.json exists
2. If not, create new shuffled game
3. If yes, load existing game
4. Show user their current tiles from state