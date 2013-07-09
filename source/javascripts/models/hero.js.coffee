class RaY.Models.Hero  
  
  constructor: (@context) ->
    @image = new Image()
    @image.src = "images/game/hero.png"
    @width = 65
    @height = 95
    @x = 0
    @y = 0
    @frames = 1
    @interval = 4
    @currentFrame = 0
  
  setPosition: (x,y) ->
    @x = x
    @y = y
    
  draw: ->
    try
      @context.drawImage(@image, 0, @height * @currentFrame, @width, @height, @x, @y, @width, @height)
    catch e
    
    if @interval == 4
      @nextFrame()
      @interval = 0
    @interval += 1
    
  nextFrame: ->
    if @currentFrame == @frames
      @currentFrame = 0
    else
      @currentFrame += 1

