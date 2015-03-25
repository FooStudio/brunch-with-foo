AbstractView = require 'base/AbstractView'

class HeaderView extends AbstractView
    className: 'Header'
    template : require 'views/templates/Header'

module.exports = HeaderView