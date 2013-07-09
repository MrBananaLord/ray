class RaY.Models.Hero
  constructor: (@context) ->
    @image = new Image()
    @image.src = "images/game/hero.png"
    @width = 65
    @height = 95
    @x = 0
    @y = 0
  
  setPosition: (x,y) ->
    @x = x
    @y = y
    
  draw: ->
    try
      @context.drawImage(@image, 0, 0, @width, @height, @x, @y, @width, @height)
    catch e
