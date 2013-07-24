class RaY.Engine.Entity extends RaY.Engine.Sprite
  @include RaY.Engine.Modules.Callbacks
  
  collidable: false
  gravitable: false
  speed: 0
  
  update: (modifier) ->
    @applyPhysics(modifier)
    @destinationX = @x
    @destinationY = @y
  
  render: ->
    @drawImage(@sourceX, @sourceY, @destinationX, @destinationY)
  
  setPosition: (x, y) =>
    @x = x
    @y = y
  
  velocity: (modifier) -> @speed * modifier
  
  applyPhysics: (modifier) =>
    @applyGravity(modifier) if @gravitable
    @world.checkCollisions(this, modifier) if @collidable
    
  applyGravity: (modifier) =>
    @setPosition(@x, @y + @world.gravity * modifier)
  
  centerX: -> @x + (@width / 2)
  centerY: -> @y + (@height / 2)
  
  collidesWith: (element) =>
    w = 0.5 * (this.width + element.width)
    h = 0.5 * (this.height + element.height)
    dx = this.centerX() - element.centerX()
    dy = this.centerY() - element.centerY()

    if (Math.abs(dx) <= w && Math.abs(dy) <= h)
      wy = w * dy
      hx = h * dx

      if (wy > hx)
        if (wy > -hx)
          console.debug "top"
        else
          console.debug "left"
      else
        if (wy > -hx)
          console.debug "right"
        else
          console.debug "bottom"
      return true
    false
  
  previousX: -> @destinationX
  previousY: -> @destinationY
