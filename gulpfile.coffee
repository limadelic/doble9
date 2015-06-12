g = require 'gulp'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'
shell = require 'gulp-shell'
rename = require 'gulp-rename'
serve = require 'gulp-serve'
watch = require 'gulp-watch'
clean = require 'gulp-clean'
runSequence = require 'run-sequence'

src = 'src/**/*.coffee'
specs = 'test/**/*.coffee'
static_files = [
  'src/index.html'
  'src/css/**'
  'src/img/**'
]

g.task 'clean', ->
  g.src 'dist'
  .pipe clean()

g.task 'coffee', ->
  g.src src
  .pipe coffee bare: true
  .pipe g.dest 'dist/js'

g.task 'copy', ->
  g.src static_files, base: 'src'
  .pipe g.dest 'dist'

g.task 'browserify', ->
  g.src 'dist/js/app.js'
  .pipe browserify()
  .pipe rename 'bundle.js'
  .pipe g.dest 'dist'

g.task 'test', shell.task 'mocha'
g.task 'tdd', ['test'], -> g.watch [src, specs], ['test']

g.task 'serve', ['default'], serve 'dist'
g.task 'watch', ['serve'], -> g.watch src, ['serve']

g.task 'default', ->
  runSequence 'clean', 'coffee', 'copy', 'browserify'

