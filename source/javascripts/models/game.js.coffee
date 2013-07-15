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
    
    @platforms = @generatePlatforms()
    @gameLoop()
  
   gameLoop: =>
    @background.update()
    @platforms.forEach (platform) =>
      platform.update()
    
    @checkCollisions()
      
    @hero.update()
    
    @loopTimeout = setTimeout(@gameLoop, 1000 / 50)
      
    
   generatePlatforms: =>
    _(10).times => new RaY.Models.Platform(@context)
  
  checkCollisions: =>
    @platforms.forEach (platform) =>
      @hero.fallStop() if @hero.falling && @hero.collides(platform)
        
          
          
        
    
  
