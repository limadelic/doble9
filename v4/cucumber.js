module.exports = {
  default: {
    require: ['features/step_definitions/**/*.js', 'features/support/**/*.js'],
    format: ['progress', 'json:reports/cucumber_report.json'],
    publishQuiet: true
  }
};