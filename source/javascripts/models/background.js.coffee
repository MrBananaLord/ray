class MyGame.Models.Background extends MyGame.PhysX.Rectangle  
  constructor: (@context) ->
    @width = @context.canvas.clientWidth
    @height = @context.canvas.clientHeight
    super(@context, 0, 0, @width, @height, '#d0e7f9')
    @draw()
