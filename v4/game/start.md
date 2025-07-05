# Start New Game

Follow these steps to start a dominoes game:

## 1. Create Initial State
Copy state0.json to state.json

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