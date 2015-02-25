App = require './App'

options = {}

options.IS_LIVE = do -> return if window.location.host.indexOf('localhost') > -1 or window.location.search is '?d' then false else true
# IS_LIVE = false

view = (window or document)

view.App = new App options


###
view.App.Vent = _.clone(Backbone.Events)

if view.App
  $ ->
    view.App.init()

###
