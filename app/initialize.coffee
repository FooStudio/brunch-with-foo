App = require './App'

options = {}

options.IS_LIVE = do -> return if window.location.host.indexOf('localhost') > -1 or window.location.search is '?d' then false else true
# IS_LIVE = false

#Raven initialize
Raven.config('sentry URL').install()

view = (window or document)

#Marionette Behaviors initialize
window.Behaviors = {};
Marionette.Behaviors.behaviorsLookup = ()=>
    return window.Behaviors;

view.App = new App (options)
view.App.start()

