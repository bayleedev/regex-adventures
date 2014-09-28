module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-css"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-html-build"
  grunt.loadNpmTasks "grunt-mocha"
  grunt.loadNpmTasks "grunt-http-server"

  ###
  # Creates the test env for crafty.
  ###
  grunt.registerTask "build:test", [
    "clean:build",
    "copy:js",
    "copy:img",
    "copy:css",
    "copy:test",
    "coffee:build_dev",
    "coffee:build_tests",
    "htmlbuild:build",
    "mocha:test",
  ]

  ###
  # Copys images, compiles coffee, compiles less,
  # and creates the html page.
  ###
  grunt.registerTask "build:dev", ["build"]
  grunt.registerTask "build", [
    "clean:build",
    "copy:img",
    "copy:js",
    "copy:css",
    "coffee:build_dev",
    "less:build",
    "htmlbuild:build",
  ]

  ###
  # Production build also compiles all styles and
  # scripts to a single file and minifies.
  ###
  grunt.registerTask "build:prod", [
    "clean:build",
    "copy:img",
    "copy:js",
    "copy:css",
    "coffee:build",
    "less:build",
    "uglify:build",
    "cssmin:build",
    "clean:jsmin",
    "clean:cssmin",
    "htmlbuild:build",
  ]

  ###
  # Does a development build, then watches for changes.
  ###
  grunt.registerTask "build:watch", [
    "build",
    "watch",
  ]

  ###
  # Does a development build, then watches for changes.
  ###
  grunt.registerTask "server", [
    "http-server"
  ]

  grunt.initConfig
    mocha:
      test:
        src: ['build/test.html']
        options:
          run: false
    watch:
      dev:
        files: ["src/**/*"]
        tasks: ["build"]

    clean:
      test:
        src: ["test/**/*"]
        options:
          "no-write": false
      build:
        src: ["build/**/*"]
        options:
          "no-write": false
      jsmin:
        src: ["build/**/*.js", "!build/**/*.min.js"]
        options:
          "no-write": false
      cssmin:
        src: ["build/**/*.css", "!build/**/*.min.css"]
        options:
          "no-write": false

    copy:
      img:
        files: [
          cwd: "./src/img/"
          expand: true
          flatten: false
          src: ["**/*"]
          dest: "build/img"
          filter: "isFile"
        ]
      css:
        files: [
          cwd: "src/css/"
          expand: true
          flatten: false
          src: ["**/*.css", "!vendor/mocha.css"]
          dest: "build/css"
          filter: "isFile"
        ]
      js:
        files: [
          cwd: "src/js/"
          expand: true
          flatten: false
          src: ["**/*.js", "!vendor/sinon.js", "!vendor/chai.js", "!vendor/mocha.js"]
          dest: "build/js"
          filter: "isFile"
        ]
      test:
        files: [
          cwd: "src/"
          expand: true
          flatten: false
          src: [
            "js/vendor/sinon.js",
            "js/vendor/mocha.js",
            "js/vendor/chai.js",
            "css/vendor/mocha.css",
          ]
          dest: "build/"
          filter: "isFile"
        ]

    less:
      build:
        files:
          # Put CSS manifests here
          "build/css/main.css": ["src/css/main.less"]

    coffee:
      build_tests:
        files: [
          expand: true
          cwd: "src/js/"
          src: ["spec/**/*.coffee"]
          dest: "build/js/"
          ext: ".js"
        ]
      build_dev:
        files: [
          expand: true
          cwd: "src/js/"
          src: ["**/*.coffee"]
          dest: "build/js/"
          ext: ".js"
        ]
      build:
        options:
          join: true
        files: [
          'build/js/core.js': [
            "src/js/game.coffee",
            "src/js/models/**/*.coffee",
            "src/js/**/*.coffee",
            "!src/js/spec/**/*.coffee",
          ],
        ]

    cssmin:
      build:
        files: [
          expand: true
          cwd: "build/css/"
          src: ["**/*.css"]
          dest: "build/css/"
          ext: ".min.css"
        ]

    uglify:
      build:
        files: [
          'build/js/app.min.js': [
            "build/js/vendor/crafty.js",
            "build/js/core.js",
          ],
        ]

    htmlbuild:
      build:
        src: ["src/index.html", "src/test.html"]
        dest: "build/"
        options:
          scripts:
            bundle: [
              "build/js/vendor/crafty.js",
              "build/js/game.js",
              "build/js/models/**/*.js",
              "build/js/**/*.js",
              "!build/js/spec/**/*.js",
              "!build/js/vendor/mocha.js",
              "!build/js/vendor/chai.js",
              "!build/js/vendor/sinon.js",
            ]
            test: [
              "build/js/vendor/mocha.js",
              "build/js/vendor/chai.js",
              "build/js/vendor/sinon.js",
            ]
            spec: [
              "build/js/spec/**/*.js",
            ]
          styles:
            bundle: ["build/css/**/*.css"]

    "http-server":
      dev:
        root: "build/",
        port: 3000,
        host: "127.0.0.1",
        cache: 1,
        showDir : true,
        autoIndex: true,
        defaultExt: "html",
        runInBackground: false
