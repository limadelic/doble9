# V4 Dominoes Project Context

## Current State
- Atomic state management with separate JSON files in state/ folder
- Contract-based verification (preconditions/postconditions/invariants as todos)
- Simplified dealing with dominoes.js + ruby shuffle + jq slicing
- Systematic ASCII generation using numbers.json pattern lookup
- File-based display to OUT.md with grep-based verification testing

## Key Components Working
1. dominoes.js: master template with all 55 tiles
2. deal.md: shuffle once, slice cleanly (no loops)
3. numbers.json: exact dot patterns for reliable ASCII generation
4. display.md: systematic pattern lookup and tile building
5. Grep-based testing: programmatic verification of ASCII output

## Recent Breakthroughs
- Replaced random dealing loops with single shuffle + array slicing
- Created numbers.json for reliable dot pattern lookup
- Built grep-based testing system that catches generation errors
- Proved "English as programming language" concept with systematic testing
- All contract verification working via todo system

## Testing Strategy
- Generate tiles systematically using numbers.json
- Parse tiles back using regex/grep dot counting
- Compare parsed vs original to verify correctness
- Catch bugs early with automated verification

## Next Steps
System is now solid - continue building game logic on this foundation