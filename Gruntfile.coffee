module.exports = (grunt) ->
  
  grunt.loadNpmTasks 'grunt-contrib-sass'
  
  grunt.initConfig
    sass:
      dist:
        options:
          style: 'compressed'
        expand: true
        cwd: './'
        src: ['*.sass']
        dest: './'
        ext: '.css'
      dev:
        options:
          style: 'expanded'
          debugInfo: true
          lineNumbers: true
        expand: true
        cwd: './'
        src: ['*.sass']
        dest: './'
        ext: '.css'

  grunt.registerTask 'default', ['sass']
