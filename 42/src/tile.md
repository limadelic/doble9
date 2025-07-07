# Domino Tile Drawing Instructions

## Overview
When asked to draw a domino (e.g., "99", "64", "03"), render it as beautiful ASCII art using the templates below.

## Domino Format
- Input: Two digits (e.g., "99", "64", "03")
- First digit = left/top side
- Second digit = right/bottom side
- Always draw horizontally by default (left-right layout)

## Horizontal Domino Template
```
┌───────┬───────┐
│   L   │   R   │
│       │       │
│       │       │
└───────┴───────┘
```

## Vertical Domino Template
```
┌───────┐
│       │
│   T   │
│       │
├───────┤
│       │
│   B   │
│       │
└───────┘
```

## Number Patterns (for inside tiles)
Replace L/R/T/B with these patterns:

**0 (blank):**
```
       
       
       
```

**1:**
```
       
   ●   
       
```

**2:**
```
 ●     
       
     ● 
```

**3:**
```
 ●     
   ●   
     ● 
```

**4:**
```
 ●   ● 
       
 ●   ● 
```

**5:**
```
 ●   ● 
   ●   
 ●   ● 
```

**6:**
```
 ●   ● 
 ●   ● 
 ●   ● 
```

**7:**
```
 ●   ● 
 ● ● ● 
 ●   ● 
```

**8:**
```
 ● ● ● 
 ●   ● 
 ● ● ● 
```

**9:**
```
 ● ● ● 
 ● ● ● 
 ● ● ● 
```

## Examples

### 64 (horizontal):
```
┌───────┬───────┐
│ ●   ● │ ●   ● │
│ ●   ● │ ●   ● │
│ ●   ● │ ●   ● │
└───────┴───────┘
```

### 32 (horizontal):
```
┌───────┬───────┐
│ ●     │ ●     │
│   ●   │       │
│     ● │     ● │
└───────┴───────┘
```

### 00 (blank domino):
```
┌───────┬───────┐
│       │       │
│       │       │
│       │       │
└───────┴───────┘
```

### 99 (double nine):
```
┌───────┬───────┐
│ ● ● ● │ ● ● ● │
│ ● ● ● │ ● ● ● │
│ ● ● ● │ ● ● ● │
└───────┴───────┘
```

## Special States

### Face Down (back):
```
┌───────┬───────┐
│\\//\\/│\\//\\/│
│//\\//│//\\//\│
│\\//\\/│\\//\\/│
└───────┴───────┘
```

### Selected (highlighted):
```
╔═══════╤═══════╗
║   L   │   R   ║
║       │       ║
║       │       ║
╚═══════╧═══════╝
```

## Rules
1. Always render horizontally unless specifically asked for vertical
2. Center the dot patterns within each tile section
3. Use the exact box drawing characters shown
4. Maintain consistent spacing and alignment
5. For double tiles (like 66, 99), both sides are identical
6. For mixed tiles (like 64, 32), left side is first digit, right side is second digit

## Quick Reference
- Input "64" → 6 dots on left, 4 dots on right
- Input "32" → 3 dots on left, 2 dots on right  
- Input "00" → blank on both sides
- Input "99" → 9 dots on both sides