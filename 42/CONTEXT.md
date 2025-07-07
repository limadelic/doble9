# V4 Dominoes Project Context

## Current State - BREAKTHROUGH ACHIEVED! 🎯
- Src/dist compilation architecture working
- NPM package distribution successful  
- Local install + npx execution pattern proven
- Claude correctly reads CLAUDE.md and executes @start.md pattern
- English programming language concept validated

## Distribution Pattern That Works
Users: `mkdir temp && cd temp && npm install doble9 && npx doble9`
- Script: `cd node_modules/doble9/dist && claude "start a new game"`
- Claude finds CLAUDE.md, knows it's Cuban dominoes, executes @start.md
- No global install headaches, no symlink gymnastics

## Project Structure  
- **src/**: Development source (not published)
- **dist/**: Compiled execution plans (published to npm)
- **doble9**: Script that launches Claude in dist/ folder
- **package.json**: NPM package with dist/ + doble9 only

## Key Insights Learned
- npm `"files": ["dist/", "doble9"]` publishes clean package
- Dev dependency pattern perfect for testing real user experience
- `@start.md` include pattern allows modular compilation
- Contract-based verification through todo tracking works

## Current Task  
Build the compiler that transforms src/ to dist/ with detailed execution plans
- Empty start.md ready for compilation
- CLAUDE.md correctly references @start.md
- Foundation solid for building game logic