AbstractItemView = require 'base/AbstractItemView'

class ContentView extends AbstractItemView
    className: 'Content'
    template : require 'views/templates/Content'

module.exports = ContentView
