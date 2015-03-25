MainRouter = require 'routers/main'
Facebook = require 'lib/facebook'
Data = require 'Data'
Share = require 'lib/share'
Breakpoint = require 'lib/breakpoints'
AuthManager = require 'lib/AuthManager'
Layout = require 'layouts/AppLayout'
AudioManager = require 'lib/audioManager'



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
            console.info 'App options:', options
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
        @audioManager = new AudioManager @objectComplete
        @audioManager.load()


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
        @auth = new AuthManager()
        @share = new Share
        @sections = new MainRouter
        @breakPoints = new Breakpoint

        # @rootView = new Layout
        # @rootView.render();


        if Backbone.history
            Backbone.history.start()

        @initSDKs()
        @animate()

    initSDKs:()->
        ##Facebook.load()
        #askPermissions()
        null

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
