AbstractView = require 'base/AbstractView'

class ContentView extends AbstractView
    className: 'Content'
    template : require 'views/templates/Content'

module.exports = ContentView