class RaY.Engine.Rectangle extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  
  destinationX: 0
  destinationY: 0
  width: 0
  height: 0
  x: 0
  y: 0
  collidable: false
  
  constructor: (@world, @fillStyle = "#fff") ->
      
  render: ->
    @world.context.fillStyle = @fillStyle
    @world.context.fillRect(@destinationX, @destinationY, @width, @height)
  
  update: (modifier) ->
    @destinationX = @x
    @destinationY = @y
  
  collidesWith: (element) => false
  

