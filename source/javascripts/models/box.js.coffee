class RaY.Models.Box extends RaY.Engine.Rectangle
  collidable: true
  gravitable: true
  height: 20
  width: 20
  
  constructor: (@world, @x, @y, @fillStyle) ->
    super(@world)
