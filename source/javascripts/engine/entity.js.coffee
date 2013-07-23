class RaY.Engine.Entity extends RaY.Engine.Sprite
  update: (modifier) ->
    @applyPhysics(modifier)
    @destinationX = @x
    @destinationY = @y
  
  render: ->
    @drawImage(@sourceX, @sourceY, @destinationX, @destinationY)
  
  setPosition: (x, y) =>
    @x = x
    @y = y
  
  applyPhysics: (modifier) =>
    @applyGravity(modifier) if @gravitable
    
  applyGravity: (modifier) =>
    @setPosition(@x, @y + 3)
