class RaY.Models.Background extends RaY.Engine.Rectangle
  fillStyle: "#45f"
  constructor: (world) ->
    @width = world.viewWidth
    @height = world.viewHeight
    super(world)
