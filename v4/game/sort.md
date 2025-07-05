# Sort

## Goal
Help user identifying best suits 

## Instructions
- Find most repeated number across all tiles
- Group tiles containing that number
- Flip tiles so matching numbers are next to each other
- Find second most repeated number
- If it connects to first group, join them
- Repeat until all tiles are sorted

## Example
Input: ["05", "49", "55", "77", "89", "08", "66", "27", "13", "19"]

Analysis:
- Count occurrences: 5 appears 3 times (05, 49, 55), 9 appears 3 times (49, 89, 19)
- Most repeated: 5 and 9 are tied
- 49 connects both groups (has both 5 and 9)

Output: ["55", "05", "49", "89", "19", "77", "66", "08", "27", "13"]
(5s group connected to 9s group via 49, then doubles, then singles)

## Invariant
User keeps same tiles just in different order

