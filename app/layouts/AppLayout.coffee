Template = require 'layouts/templates/AppLayout'

class AppLayout extends Marionette.LayoutView
    el: 'main'
    template : Template
    regions:{
        header:'header',
        content:'#content',
        footer:'footer'
    }

module.exports = AppLayout
