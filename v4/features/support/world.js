const { setWorldConstructor, Before, After } = require('@cucumber/cucumber');
const puppeteer = require('puppeteer');

class CustomWorld {
  constructor() {
    this.browser = null;
    this.page = null;
  }

  async openBrowser() {
    this.browser = await puppeteer.launch({
      headless: true,
      args: ['--no-sandbox', '--disable-dev-shm-usage']
    });
    this.page = await this.browser.newPage();
  }

  async closeBrowser() {
    if (this.browser) {
      await this.browser.close();
    }
  }
}

setWorldConstructor(CustomWorld);

Before(async function() {
  await this.openBrowser();
});

After(async function() {
  await this.closeBrowser();
});