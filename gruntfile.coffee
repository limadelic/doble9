module.exports = (g) ->

  static_files = [
    'index.html'
    'css/**'
    'img/**'
  ]

  g.initConfig

    config:
      package: g.file.readJSON 'package.json'

    clean: [ 'dist' ]

    watch:
      coffee:
        files: 'src/*.coffee'
        tasks: ['coffee:compile']

    coffee:
      compile:
        expand: true
        options:
          sourceMap: true
          bare: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'dist/js'
        ext: '.js'

    browserify:
      all:
        src: ['dist/js/app.js']
        dest: 'dist/doble9.js'

    copy:
      static:
        expand: true
        cwd: 'src'
        src: static_files
        dest: 'dist/'

  require('load-grunt-tasks') g

  g.registerTask('build', ['clean', 'coffee', 'browserify', 'copy'])
  g.registerTask('default', ['build', 'watch'])