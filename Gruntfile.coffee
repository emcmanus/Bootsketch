#
# You probably just want to run `grunt`
#
module.exports = (grunt) ->

  grunt.initConfig({

    bower: {
      install: {
        options: {
          targetDir: "dist/js/bower"
        }
      }
    }

    coffee: {
      compile: {
        options: {
          bare: true
          sourceMap: true
        },
        files: [{
          expand: true,
          cwd: "src/js/"
          src: ["*.coffee"]
          dest: "dist/js/"
          ext: ".js"
        }]
      }
    }

    less: {
      compile: {
        options: {
          strictUnits: true
          strictMath: true
        }
        files: [{
          expand: true
          cwd:  "src/css/"
          dest: "dist/css/"
          src:  "*.less"
          ext:  ".css"
        }]
      }
    }

    copy: {
      html: {
        files: [{
          expand: true
          cwd:  "src/"
          src:  "**.html"
          dest: "dist/"
        }]
      }
      img: {
        files: [{
          expand: true
          cwd:  "src/img/"
          dest: "dist/img/"
          src: ["*.png", "*.jpg", "*.jpeg", "*.gif"]
        }]
      }
    }

    watch: {
      options: {
        livereload: true
      }
      coffee: {
        files: "src/js/**.coffee"
        tasks: ["coffee:compile"]
      }
      less: {
        files: "src/css/**.less"
        tasks: ["less:compile"]
      }
      html: {
        files: "src/**.html"
        tasks: "copy:html"
      }
      img: {
        files: "src/**.png"
        tasks: "copy:img"
      }
    }

    connect: {
      server: {
        options: {
          debug: true
          base: "dist"
        }
      }
    }

  })

  grunt.registerTask('default', ["copy", "coffee", "less", "bower:install", "connect:server", "watch"])

  grunt.loadNpmTasks('grunt-bower-task')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-connect')

