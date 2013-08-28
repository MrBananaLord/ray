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
    
  bindToEvents: =>
    @world.bind "storePreviousData", () =>
      @previousX = @x
      @previousY = @y
    
  render: ->
    @world.context.fillStyle = @fillStyle
    @world.context.fillRect(@x, @y, @width, @height)    
  
  update: ->
    @applyPhysics()
    
  applyPhysics: =>
    @applyGravity() if @gravitable
    @world.checkCollisions(this) if @collidable
    
  applyGravity: ->
    @setPosition(@x, @y + @world.gravity * @world.modifier)
  
  velocity: -> @speed * @world.modifier
  
  setPosition: (x, y) =>
    @x = x
    @y = y
    
  centerX: -> @x + (@width / 2)
  centerY: -> @y + (@height / 2)
  
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
