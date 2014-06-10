class RaY.Engine.Rectangle extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  
  width: 0
  height: 0
  x: 0
  y: 0
  collidable: false
  gravitable: false
  fillStyle: "#000"
  speed: 0
  previousX: 0
  previousY: 0
  maximumSpeed: 8
  fallingCounter: 0
  falling: false
  
  constructor: (@world) ->
    @bindToEvents()
    super
    
  bindToEvents: ->
    @bind @world, "update", () =>
      @update()
      @rememberPosition()
    @bind @world, "render", () =>
      @render()
    @bind @world, "collision", (object, element) =>
      @manageCollisionWith(element) if object == this
    @bind @world, "checkCollisionsWith", (element) =>
      if this != element and @collidable
        element.checkAndTriggerCollisionsWith(this)
    
  rememberPosition: () ->
    @previousX = @x
    @previousY = @y
    
  render: ->
    @world.context.fillStyle = @fillStyle
    @world.context.fillRect(@x, @y, @width, @height)
  
  update: ->
    @applyPhysics()
    
  applyPhysics: =>
    @applyGravity() if @gravitable
    @world.trigger("checkCollisionsWith", this)
    
  applyGravity: ->
    @fall()
    
  applyForce: (x, y) ->
    @setPosition(@x + x, @y + y) if @gravitable
  
  setPosition: (x, y) =>
    @x = x
    @y = y
    
  bottom: -> @y + @height
  top: -> @y
  left: -> @x
  right: -> @x + @width
  movementVector: -> [@x - @previousX, @y - @previousY]
  
  debug: -> console.debug @left(), @top()
  
  checkAndTriggerCollisionsWith: (element) ->
    if this.collidesWith(element)
      @world.trigger("collision", this, element)
  
  collidesWith: (element) =>
  	not
      ((element.bottom() < this.top()) or
		  (element.top() > this.bottom()) or
		  (element.left() > this.right()) or
		  (element.right() < this.left()))
		  
  manageCollisionWith: (element) ->
    @manageSideCollision(element) if @gravitable
      
  manageSideCollision: (element) ->
    if @left() <= element.right() and
       @x < @previousX and
       element.right() <= @previousX and
       not @xAxisAdjacentWith(element)
      @leftSideCollisionWith(element)
    if @right() >= element.left() and
       @x > @previousX and
       element.left() - @width >= @previousX and
       not @xAxisAdjacentWith(element)
      @rightSideCollisionWith(element)
    if @top() <= element.bottom() and
       @y < @previousY and
       element.bottom() <= @previousY and
       not @yAxisAdjacentWith(element)
      @topSideCollisionWith(element)
    if @bottom() >= element.top() and
       @y > @previousY and
       element.top() - @height >= @previousY and
       not @yAxisAdjacentWith(element)
      @bottomSideCollisionWith(element)
      
  bottomAdjacentWith: (element) ->
    @bottom() == element.top() or
    @bottom() - @world.gravity == element.top()
  topAdjacentWith: (element) ->
    @top() == element.bottom()
  leftAdjacentWith: (element) ->
    @left() == element.right()
  rightAdjacentWith: (element) ->
    @right() == element.left()
  xAxisAdjacentWith: (element) ->
    @bottomAdjacentWith(element) or @topAdjacentWith(element)
  yAxisAdjacentWith: (element) ->
    @leftAdjacentWith(element) or @rightAdjacentWith(element)
  
  leftSideCollisionWith: (element) ->
    @setPosition(element.right(), @y)
  rightSideCollisionWith: (element) ->
    @setPosition(element.left() - @width, @y)
  topSideCollisionWith: (element) ->
    @setPosition(@x, element.bottom())
  bottomSideCollisionWith: (element) ->
    @setPosition(@x, element.top() - @height)
    @endFalling()
    
  fall: ->
    @y += @fallingCounter * @world.gravity
    unless @fallingCounter >= @maximumSpeed
      @fallingCounter += 1  
  startFalling: ->
    @falling = true
    @fallingCounter = 0
  endFalling: ->
    @falling = false
    @fallingCounter = 0

