# StackView

The `StackView` class, is an extension of the default `Marionette.ItemView` class, adding the functionality to display views on a sliding stack with `push` and `pop`.

The transitions are made with CSS, defined on `app/styles/_stack.scss` Sass file. 

The transitions require `animate.css`, a slim version is included at `app/styles/_animate.scss`.

The included transitions are:
	
* slideInFromRight
* slideInFromLeft
* slideOutToRight
* slideOutToLeft

To use `StackView` we have to create a View that extends `StackView`, or to instantiate a new `StackView`.

The `push` method recieves a `Marionete.View` descendant instance , wich will be placed at the top of the stack and animated.

The `pop` method recieves no parameters, and will animate out the top-most view on the stack, destroying it after the animation was completed.

the default parameters of `StackView` class are as follows:

* `inTransitionClass (default: 'slideInFromRight')` Defines the css in animation  class that will be used
* `outTransitionClass (default: 'slideOutToRight')` Defines the css out animation  class that will be used
* `animationClass (default: 'animated')` Defines the css class that will be used to display animations. No need to override on most cases.
* `transitionDelay (default: 1000)` Defines the duration (in milliseconds) of the animations, must match the css animation duration
* `"class" (default: 'stacks')` Defines the css class that the stack container will have.
* `itemClass (default: 'stack-item')` Defines the css class all stack items will have.

To override the default parameters, we do it in the instance of the `StackView` or in the class that extends from it.

	stackView = new StackView( {inTransitionClass:"slideInFromTop", transitionDelay:2000} )
	
	
## Usage

	StackView = require "base/StackView"
	StackViewItem = require "views/StackViewItemView"

	class ContainerView extends Marionette.LayoutView
	
		regions:{
			stacks:"#stackView"
		}
		
		onRender:()=>
			@stackView = new stackView()
			
			v = new StackViewItem()
			@stackView.setRootView(v)
			@stacks.show @stackView
			_delay(@onShowNewView, 3000)	
			
			
		onShowNewView:()=>
			v = new StackItemView()
			@stackView.push(v)
			
	






