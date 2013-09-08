class RaY.Models.Platform extends RaY.Engine.Rectangle
  collidable: true
  gravitable: false
  
  constructor: (@world, @x, @y, @width, @height, @fillStyle) ->
    super(@world)
