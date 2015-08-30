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
      build:
        files: 'src/**'
        tasks: ['build']
      tdd:
        files: [
          'src/**/*.coffee'
          'test/**/*.coffee'
        ]
        tasks: ['tdd']

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

    connect:
      doble9:
        options:
          port: 99
          base: 'dist'

    shell:
      mocha: command: 'mocha'

  require('load-grunt-tasks') g

  g.option 'force', true

  g.registerTask('build', ['clean', 'coffee', 'browserify', 'copy'])
  g.registerTask('tdd', ['shell:mocha', 'watch:tdd'])
  g.registerTask('server', ['build', 'connect', 'watch:build'])
  g.registerTask('default', ['server'])