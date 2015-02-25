MainRouter = require 'routers/main'
Facebook = require 'lib/facebook'
Data = require 'Data'
Share = require 'lib/share'
Breakpoint = require 'lib/breakpoints'
AuthManager = require 'lib/AuthManager'

class App
  debug:true;
  views:null;
  data:null;
  width:window.innerWidth;
  height:window.innerHeight;
  objReady:0;

  constructor:(@LIVE)->
    require 'lib/helpers'
    @addListeners()
    null

  addListeners:=>
    $(window).on 'resize', @resize

    null

  resize:=>
    @width = window.innerWidth
    @height = window.innerHeight

    null

  objectComplete : =>
    @objReady++
    if @objReady >= 2
      @initApp()

    null

  init:()=>
    #preloader, remember change objectComplete method
    @data = new Data @objectComplete
    #@breakPoints = new Breakpoint @objectComplete
    # console.log @data
    return

  initApp:()=>
    if @debug and bowser.name is "Chrome"
      @stats = new MemoryStats()
      @renderStats()

    @data = new Data
    @auth  = new AuthManager()
    @share   = new Share()
    @sections = new MainRouter()
    @breakPoints = new Breakpoint

    @initSDKs()
    @animate()

    null

  initSDKs : ->
    Facebook.load()
    # @askPermisions()

    null

  animate:=>
    requestAnimationFrame(@animate)
    if @debulg
      @stats.update();

    null

  renderStats:()=>
    @stats.domElement.style.position = 'fixed'
    @stats.domElement.style.right = '0px'
    @stats.domElement.style.bottom = '0px'
    document.body.appendChild( @stats.domElement )

    null

module.exports = App