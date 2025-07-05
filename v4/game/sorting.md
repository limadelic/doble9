# Tile Sorting Instructions

## Purpose
Sort user's tiles to highlight strongest hands and groups.

## Sorting Algorithm
1. **Group by numbers**: Find all tiles with same number (8s, 9s, etc.)
2. **Count group sizes**: How many tiles per number
3. **Sort by strength**: Biggest groups first, singles last
4. **Display order**: Strongest groups → medium groups → singles

## Example Analysis
Hand: ["99", "68", "38", "45", "78", "29", "58", "04", "05", "19"]

Groups:
- 8s: 68, 38, 78, 58 (4 tiles) ← STRONGEST
- 9s: 99, 29, 19 (3 tiles) ← STRONG  
- 5s: 45, 58, 05 (3 tiles) ← STRONG
- 4s: 45, 04 (2 tiles) ← MEDIUM
- 0s: 04, 05 (2 tiles) ← MEDIUM

Sorted display: 68, 38, 78, 58, 99, 29, 19, 45, 05, 04

## Implementation
Use Ruby to:
1. Parse each tile into two numbers
2. Group tiles by each number they contain
3. Find groups with 2+ tiles (strong hands)
4. Sort groups by size (descending)
5. Within groups, sort tiles numerically
6. Append remaining singles at end

## Strong Hand Indicators
- **4+ tiles**: Dominant (very strong)
- **3 tiles**: Strong 
- **2 tiles**: Medium
- **1 tile**: Singles (weakest)

This sorting makes hand strength immediately visible to the player.