class RaY.Engine.Entity extends RaY.Engine.Sprite
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
    
  applyGravity: (modifier) =>
    @setPosition(@x, @y + @world.gravity * modifier)
