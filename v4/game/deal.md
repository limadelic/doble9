# Deal

## Precondition
state.json equals state0.json

## Instructions
- Pick 1 random domino from dominoes array
- Move it to current player
- Repeat for each player in counter-clockwise order: user → right → front → left
- Continue until each player has 10 dominoes
- Save to state.json

## Postconditions
- Dominoes array has 15 dominoes left
- Each player has 10 dominoes
- No domino is duplicated