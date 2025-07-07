const { Given, When, Then } = require('@cucumber/cucumber');
const assert = require('assert');

Given('I open the DOBLE9 app', async function() {
  await this.page.goto('http://localhost:3000', { waitUntil: 'networkidle2' });
});

When('the page loads', async function() {
  await this.page.waitForSelector('h1');
});

Then('I should see {string} displayed on the page', async function(expectedText) {
  const heading = await this.page.$eval('h1', el => el.textContent);
  assert.strictEqual(heading, expectedText);
});