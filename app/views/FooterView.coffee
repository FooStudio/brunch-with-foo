AbstractView = require 'base/AbstractView'

class FooterView extends AbstractView
    className: 'Footer'
    template : require 'views/templates/Footer'

module.exports = FooterView