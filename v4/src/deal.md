# Deal

## Requires
- dominoes.json

## Instructions

- Deal 10 dominoes to each player:
```bash
# Copy and shuffle dominoes
mkdir -p state/
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

- Ensure that:
```bash
# Verify deal worked correctly
[ $(jq length state/dominoes.json) -eq 15 ]
[ $(jq length state/user.json) -eq 10 ]
[ $(jq length state/right.json) -eq 10 ]
[ $(jq length state/front.json) -eq 10 ]
[ $(jq length state/left.json) -eq 10 ]
```