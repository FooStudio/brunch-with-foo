# Created by mendieta on 4/27/15.

class StackView extends Marionette.ItemView

    #view has root view defined?
    hasRootView:false

#define options for transitioning views in and out
    defaults:{
        inTransitionClass: 'slideInFromRight',
        outTransitionClass: 'slideOutToRight',
        animationClass: 'animated',
        transitionDelay: 1000,
        'class': 'stacks',
        itemClass: 'stack-item'
    }

    initialize:(options)=>
        @views = []
        options = options || {}
        @options = _.defaults({}, @defaults, options)


#Self explanatory
    setRootView:(view)=>
        @hasRootView = true
        @views.push(view)
        view.render()
        view.$el.addClass(@options.itemClass)
        @$el.append(view.$el)

#Self explanatory
    render:()=>
        @$el.addClass(@options['class'])

    onShow:()=>
        console.log("show stack view")


#pop the top-most view of the stack
    pop:()=>
        if @views.length > (@hasRootView ? 1 : 0)
            view = @views.pop()
            @transitionViewOut(view)


#push a new view into de stack
#the itemClass will be auto-added to the parent element
    push:(view)=>
        @views.push(view)
        view.render()
        view.$el.addClass(@options.itemClass)
        @transitionViewIn(view)

#Transition the view in
#Broken out as a method for convenient override of default transition
#If you only want to change the animation use the transition class options
    transitionViewIn:(view)=>

        view.$el.addClass("hiddenToRight")
        @$el.append(view.$el);

        _.delay (->
            view.$el.addClass @options.animationClass
            view.$el.addClass @options.inTransitionClass
            _.delay (->
                view.$el.removeClass 'hiddenToRight'
            ).bind(this), @options.transitionDelay
        ).bind(this), 1



#Transition view out
#Broken out as a method for convenient override of default transition
#If you only want to change the animation use the transition class options
    transitionViewOut:(view)=>
        view.$el.addClass(@options.outTransitionClass)
        _.delay (->
            view.destroy()
        ).bind(this), @options.transitionDelay



module.exports = StackView

