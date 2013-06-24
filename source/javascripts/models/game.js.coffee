class MyGame.Models.Game
  width = 640
  height = 480
  
  constructor: (@canvas) ->
    @canvas.width = width
    @canvas.height = height
    @context = @canvas.getContext("2d")
    @background = new MyGame.Models.Background(@context)
