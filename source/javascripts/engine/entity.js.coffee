class RaY.Engine.Entity extends RaY.Engine.Sprite
  update: ->
    @destinationX = @x
    @destinationY = @y
  
  render: ->
    @drawImage(@sourceX, @sourceY, @destinationX, @destinationY)
  
  setPosition: (x, y) =>
    @x = x
    @y = y
