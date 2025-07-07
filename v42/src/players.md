# Players

## Player Names
- **user** - you (the human player)
- **right** - player to your right
- **front** - player across from you  
- **left** - player to your left

## Seating Arrangement
```
    front
left  +  right
    user
```

## Turn Order
Counter-clockwise: user → right → front → left

## Teams
- **Team 1**: user + front (partners)
- **Team 2**: right + left (partners)

## State Files
Each player has a JSON file in state/ folder:
- `state/user.json` - array of user's dominoes
- `state/right.json` - array of right player's dominoes  
- `state/front.json` - array of front player's dominoes
- `state/left.json` - array of left player's dominoes

## Example
```json
["36", "17", "27", "45", "38", "18", "34", "35", "99", "16"]
```