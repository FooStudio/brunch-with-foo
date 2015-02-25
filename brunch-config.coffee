exports.config =
    files:
        javascripts:
            joinTo:
                'js/app.js': /^(vendor|bower_components|app)/

            order:
                after: ['bower_components/requirejs/require.js']

            pluginHelpers: 'js/app.js'

        stylesheets:
            joinTo:
                'css/app.css': /^(vendor|bower_components|app)/

        templates:
            joinTo: 'js/app.js'

    plugins:
        autoReload:
            enabled:
                js: on
                css: on
                assets: off

        coffeelint:
            pattern: /^app\/.*\.coffee$/

            options:
                indentation:
                    value: 4
                    level: "warn"

                max_line_length:
                    level: "ignore"

                no_trailing_semicolons:
                    level: "ignore"

    conventions:
        assets: /(assets|vendor\/assets|font)/


