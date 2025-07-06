# Deal

## Precondition
dominoes.json exists with all 55 dominoes

## Instructions
Deal 10 dominoes to each player:

```bash
# Copy and shuffle dominoes
cp dominoes.json state/dominoes.json
DOMINOES=$(jq -r '.[]' state/dominoes.json | tr '\n' ',')
SHUFFLED=$(DOMINOES="$DOMINOES" ruby -e "puts ENV['DOMINOES'].split(',').shuffle.join(',')")

# Split shuffled dominoes into players (10 each) and remaining (15)
echo "[$SHUFFLED]" | jq -r '.[0:10]' > state/user.json
echo "[$SHUFFLED]" | jq -r '.[10:20]' > state/right.json  
echo "[$SHUFFLED]" | jq -r '.[20:30]' > state/front.json
echo "[$SHUFFLED]" | jq -r '.[30:40]' > state/left.json
echo "[$SHUFFLED]" | jq -r '.[40:55]' > state/dominoes.json
```

## Postconditions
- dominoes.json has 15 dominoes left
- Each player file has 10 dominoes
- No domino is duplicated