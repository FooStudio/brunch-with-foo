Controller = require 'controllers/main'

class MainRouter extends Marionette.AppRouter
    controller: new Controller
    appRoutes:
        '': 'index',
        'dashboard': 'dashboard'

    initialize:()->
        if(!Backbone.history)
            Backbone.history.start()
        return null

module.exports = MainRouter
