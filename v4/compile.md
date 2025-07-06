# Compile

The goal of compiling is to cache planning into a TODO list
In general the algo would be to compile individual plans for each md referenced in CLAUDE
Ideally over time you will know what pieces need to b compiled based in changes

## Instructions

- Copy src/CLAUDE.md to dist/CLAUDE.md
- List files that CLAUDE @imports
- Compile each of those files
- Be careful about what to copy or what to compile

## Compiling a file

- Files listed under Require section must be copied to dist
- Each bullet in a file is a potential TODO
- Dont import sections we only want a long bullet list
- Each Precondition becomes a TODO
- Each Instruction becomes a TODO
- Each Postcondition becomes a TODO
- Each Invariant becomes a TODO
- Only bullets can become a TODO

## Compiling a bullet into a TODO
- Bullets must start with - otherwise they are not bullets
- A single bullet leads to a single TODO
- A bullet with and @import expands in place into the compiled TODO
- Block bullets should still compile into a single bullet
- A Block bullet is a single bullet that ends in : and is followed by a block
- Do not parse nor compile the Block

## Postconditions

- Each CLAUDE @import file has a compiled file in dist
- The nested @imports are flattened into that compiled file
- Every file in a Require section was copied