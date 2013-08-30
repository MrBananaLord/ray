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
  
  constructor: (@world) ->
    @bindToEvents()
    
  bindToEvents: ->
    @world.bind "update", () =>
      @update()
      @rememberPosition()
    @world.bind "render", () => @render()
    @world.bind "collision", (object, element) =>
      if object == this
        @manageCollisionWith(element)
    
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
    @world.checkCollisionsFor(this) if @collidable
    
  applyGravity: ->
    @setPosition(@x, @y + @world.gravity)
    
  applyForce: (x, y) ->
    @setPosition(@x + x, @y + y) if @gravitable
  
  setPosition: (x, y) =>
    @x = x
    @y = y
    
  bottom: -> @y + @height
  top: -> @y
  left: -> @x
  right: -> @x + @width
  
  debug: -> console.debug @top(), @left(), @bottom(), @right()
  
  checkAndTriggerCollisionWith: (element) ->
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
       element.right() <= @previousX
      @leftSideCollisionWith(element)
    if @right() >= element.left() and
       @x > @previousX and
       element.left() - @width >= @previousX
      @rightSideCollisionWith(element)
    if @top() <= element.bottom() and
       @y < @previousY and
       element.bottom() <= @previousY
      @topSideCollisionWith(element)
    if @bottom() >= element.top() and
       @y > @previousY and
       element.top() - @height >= @previousY
      @bottomSideCollisionWith(element)

  leftSideCollisionWith: (element) ->      
    @setPosition(element.right(), @y)
  rightSideCollisionWith: (element) ->
    @setPosition(element.left() - @width, @y)
  topSideCollisionWith: (element) ->
    @setPosition(@x, element.bottom())
  bottomSideCollisionWith: (element) ->
    @setPosition(@x, element.top() - @height)

