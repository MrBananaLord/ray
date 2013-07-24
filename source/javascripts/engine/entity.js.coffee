class RaY.Engine.Entity extends RaY.Engine.Sprite
  
  render: ->
    @drawImage(@sourceX, @sourceY, @x, @y)
