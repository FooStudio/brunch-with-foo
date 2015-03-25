Layout = require 'layouts/AppLayout'


class MainController extends Marionette.Controller

    index:()=>
        @setPageTitle("HOME")

        @rootView = new Layout
        @rootView.render();

    dashboard:()=>
        @setPageTitle("DASHBOARD")


    setPageTitle: (sub=null) ->

        title = App.data.name + " - " + sub
        if window.document.title isnt title then window.document.title = title
        return null


module.exports = MainController

