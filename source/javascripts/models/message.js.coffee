class RaY.Models.Message extends RaY.Engine.Rectangle
  collidable: false
  gravitable: false
  fillStyle: "#111"
  width: 640
  height: 480
  x: 0
  y: 0
  
  constructor: (@world) ->
    super(@world)
    
  render: ->
    super
    @world.context.font = "40pt Calibri"
    @world.context.fillStyle = "#fff"
    @world.context.fillText("The End", 230, 250)
