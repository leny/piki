"use strict"

module.exports = ( grunt ) ->

    require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

    grunt.initConfig
        coffee:
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
        watch:
            lib:
                files: "lib/jquery.piki.litcoffee"
                tasks: [
                    "coffee"
                    "jshint"
                    "uglify"
                ]

        grunt.registerTask "default", [
            "coffee"
            "jshint"
            "uglify"
        ]
