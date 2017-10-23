import fs from 'fs';

fs.readFile('./src/corals.coffee', (e,txt) => {
  console.log(txt.toString())
});
