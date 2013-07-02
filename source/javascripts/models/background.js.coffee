class RaY.Models.Background
  constructor: (@context, @x = 0, @y = 0,  @width = 0, @height = 0, @color = "#d0e7f9") ->
    @width = @context.canvas.clientWidth
    @height = @context.canvas.clientHeight
    @draw()
        
  draw: ->
    @context.fillStyle = @color
    @context.beginPath()
    @context.rect(@x, @y, @width, @height)
    @context.closePath()
    @context.fill()
