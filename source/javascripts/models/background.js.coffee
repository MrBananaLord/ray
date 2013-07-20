class RaY.Models.Background extends RaY.Engine.Rectangle
  constructor: (world) ->
    @width = world.viewWidth
    @height = world.viewHeight
    super(world)
  
  render: -> super(0, 0)
