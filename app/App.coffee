MainRouter = require 'routers/main'
Facebook = require 'lib/facebook'
Data = require 'Data'
Share = require 'lib/share'
Breakpoint = require 'lib/breakpoints'
AuthManager = require 'lib/AuthManager'



class App extends Marionette.Application
    debug: true;
    views: null;
    data: null;
    width: window.innerWidth;
    height: window.innerHeight;
    objReady: 0;
    radio: Backbone.Wreqr.radio.channel('global')

    initialize:(options)->
        if @debug
            console.log 'App options:', options
        require 'lib/helpers'
        @addListeners()


    addListeners:=>
        $(window).on 'resize', @resize


    onBeforeStart:(options)=>
        if @debug
            console.info("before:start", options)


    onStart:(options)=>

        if @debug
            console.info("start:", options)

        @data = new Data @objectComplete
        @breakPoints = new Breakpoint @objectComplete

        if @debug
            #console.info @data
            null

    resize:=>
        @width = window.innerWidth
        @height = window.innerHeight

    objectComplete: =>
        @objReady++;
        if @objReady >= 2
            @initApp()


    initApp: ()=>
        if @debug and bowser.name is 'Chrome'
            @stats = new MemoryStats()
            @renderStats();

        @data = new Data
        #@auth = new AuthManager()
        @share = new Share
        @sections = new MainRouter
        @breakPoints = new Breakpoint

        @initSDKs()
        @animate()

    initSDKs:()=>
        ##Facebook.load()
        #askPermissions()

    animate:()=>
        requestAnimationFrame(@animate)
        if(@debug)
            @stats.update()

    renderStats: ()=>
        @stats.domElement.style.position = 'fixed'
        @stats.domElement.style.right = '0px'
        @stats.domElement.style.bottom = '0px'
        document.body.appendChild(@stats.domElement)

module.exports = App
