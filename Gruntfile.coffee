"use strict"

module.exports = ( grunt ) ->

    require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

    grunt.initConfig
        coffee:
            options:
                bare: yes
            lib:
                files:
                    "lib/jquery.piki.js": "lib/jquery.piki.litcoffee"
        jshint:
            options:
                curly: yes
                eqeqeq: yes
                immed: yes
                newcap: yes
                noarg: yes
                sub: yes
                undef: yes
                unused: yes
                boss: yes
                eqnull: yes
                browser: yes
                jquery: yes
                devel: yes
            lib:
                src: [
                    "lib/jquery.piki.js"
                ]
        uglify:
            lib:
                files:
                    "lib/jquery.piki.min.js": "lib/jquery.piki.js"
        stylus:
            example:
                options:
                    use: [ "nib" ]
                files:
                    "example/styles/styles.css": "example/styles/styles.styl"
        watch:
            lib:
                files: "lib/jquery.piki.litcoffee"
                tasks: [
                    "coffee"
                    "jshint"
                    "uglify"
                ]
            example:
                files: "example/styles/styles.styl"
                tasks: [
                    "stylus"
                ]

        grunt.registerTask "default", [
            "coffee"
            "jshint"
            "uglify"
        ]
