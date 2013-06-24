class MyGame.PhysX.Rectangle
  constructor: (@context, @x = 0, @y = 0,  @width = 0, @height = 0, @color = "#fff") ->
    
  draw: ->
    @context.fillStyle = @color
    @context.beginPath()
    @context.rect(@x, @y, @width, @height)
    @context.closePath()
    @context.fill()
            
