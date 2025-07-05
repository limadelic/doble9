# Start New Game

Follow these steps to start a dominoes game:

## 1. Create Initial State
Create state.json with:
```json
{
  "dominoes": ["00","01","02","03","04","05","06","07","08","09","11","12","13","14","15","16","17","18","19","22","23","24","25","26","27","28","29","33","34","35","36","37","38","39","44","45","46","47","48","49","55","56","57","58","59","66","67","68","69","77","78","79","88","89","99"],
  "players": {
    "user": [],
    "ai1": [],
    "ai2": [],
    "ai3": []
  },
  "table": [],
  "turn": "user"
}
```

## 2. Deal Tiles
Deal 10 tiles to each player:

For each of the 40 tiles to deal:
- Pick a random number from 1 to remaining dominoes count
- Take that domino from dominoes array
- Remove it from dominoes array  
- Add it to current player's array
- Save state.json
- Move to next player (user → ai1 → ai2 → ai3 → user...)

## 3. Show Game
Follow display.md to show user's tiles