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
          cwd: "src/js/",
          src: ["*.coffee"],
          dest: "dist/js/",
          ext: ".js"
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
      html: {
        files: "src/**.html"
        tasks: "copy:html"
      }
    }

    copy: {
      html: {
        files: [{
          expand: true
          cwd: "src/"
          src: "**.html"
          dest: "dist/"
        }]
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

  grunt.registerTask('default', ["copy", "coffee", "bower:install", "connect:server", "watch"])

  grunt.loadNpmTasks('grunt-bower-task')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-connect')

