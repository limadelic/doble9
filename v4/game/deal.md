# Deal

## Precondition
state/ folder contains fresh files from state0.json

## Instructions
Deal 10 dominoes to each player using jq commands:

Deal exactly 10 dominoes to each player:

```bash
for player in user right front left; do
  for i in {1..10}; do
    LENGTH=$(jq 'length' state/dominoes.json)
    INDEX=$(ruby -e "puts rand($LENGTH)")
    TILE=$(jq -r ".[$INDEX]" state/dominoes.json)
    jq "del(.[$INDEX])" state/dominoes.json > tmp && mv tmp state/dominoes.json
    jq --arg tile "$TILE" '. + [$tile]' state/$player.json > tmp && mv tmp state/$player.json
  done
done
```

## Postconditions
- dominoes.json has 15 dominoes left
- Each player file has 10 dominoes
- No domino is duplicated