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
  
  constructor: (@world) ->
    
  render: ->
    @world.context.fillStyle = @fillStyle
    @world.context.fillRect(@x, @y, @width, @height)
  
  update: -> @applyPhysics()
    
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
  
  checkCollisionWith: (element) =>
    w = 0.5 * (this.width + element.width)
    h = 0.5 * (this.height + element.height)
    dx = this.centerX() - element.centerX()
    dy = this.centerY() - element.centerY()

    if (Math.abs(dx) <= w && Math.abs(dy) <= h)
      wy = w * dy
      hx = h * dx

      side = if (wy > hx)
        if (wy > -hx)
          "top"
        else
          "right"
      else
        if (wy > -hx)
          "left"
        else
          "bottom"
      @world.trigger("collision", this, element, side)
