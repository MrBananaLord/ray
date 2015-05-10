class RaY.Models.Particle extends RaY.Engine.Rectangle
  constructor: (@world) ->
    super(@world, {
      x: 10
      y: 10
      width: 5
      height: 5
      fillStyle: "#fff"
    })
    
  destroy: ->
    console.debug 'sad'
    @purge()
