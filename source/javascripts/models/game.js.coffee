class RaY.Models.Game
  constructor: (@canvas) ->
    @width = 640
    @height = 480
    @loopTimeout = 0
    @canvas.width = @width
    @canvas.height = @height
    @context = @canvas.getContext("2d")
    
    @background = new RaY.Models.Background(@context)
    
    @hero = new RaY.Models.Hero(@context)
    @hero.setPosition(~~((@width - @hero.width)/2), ~~((@height - @hero.height)/2))
    @hero.jump()
    
    @gameLoop()
  
   gameLoop: =>
    @background.draw()
    @hero.checkJump() if @hero.jumping
    @hero.checkFall() if @hero.falling
    @hero.draw()
    @loopTimeout = setTimeout(@gameLoop, 1000 / 50)
