class MainRouter extends Backbone.Router
    routes:
        '': 'index'

    initialize:()->
        Backbone.history.start()
        @customViews()

        return null
        
    index: =>
        @setPageTitle("HOME")

        return null


    customViews:=>

        return null
        

    setPageTitle: (sub=null) ->

        title = App.data.name + " - " + sub

        if window.document.title isnt title then window.document.title = title

        return null


module.exports = MainRouter
