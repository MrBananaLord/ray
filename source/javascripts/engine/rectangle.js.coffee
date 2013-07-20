class RaY.Engine.Rectangle
  destinationX: 0
  destinationY: 0
  width: 0
  height: 0
  x: 0
  y: 0
  collidable: false
  
  constructor: (@world, @fillStyle = "#fff") ->
      
  render: (destinationX, destinationY) ->
    @world.context.fillStyle = @fillStyle
    @world.context.fillRect(destinationX, destinationY, @width, @height)
  
  update: ->
  

