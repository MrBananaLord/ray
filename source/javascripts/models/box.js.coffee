class RaY.Models.Box extends RaY.Engine.Entity
  collidable: true
  gravitable: true
  sourceWidth: 100
  sourceHeight: 100
  height: 20
  width: 20
  
  constructor: (@world, @x, @y, @s) ->
    super(@world, "box")
