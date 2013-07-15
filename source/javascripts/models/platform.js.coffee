class RaY.Models.Platform
  
  constructor: (@context) ->
    @width = 70
    @height = 20
    @x = Math.random() * (@context.canvas.height - @height)
    @y = Math.random() * (@context.canvas.width - @width)
        
  update: =>
    @draw()
        
  draw: =>
    @context.fillStyle = 'rgba(255, 255, 255, 1)'
    @context.fillRect(@x, @y, @width, @height)
