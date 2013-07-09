class RaY.Models.Game
  width = 640
  height = 480
  loopTimeout = 0
  
  constructor: (@canvas) ->
    @canvas.width = width
    @canvas.height = height
    @context = @canvas.getContext("2d")
    @background = new RaY.Models.Background(@context)
    @hero = new RaY.Models.Hero(@context)
    @gameLoop()
  
   gameLoop: =>
    @background.draw()
    @hero.draw()
    loopTimeout = setTimeout(@gameLoop, 1000 / 50)
