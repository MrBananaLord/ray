class RaY.Engine.Sprite extends RaY.Engine.Rectangle
  sourceX: 0
  sourceY: 0
  sourceWidth: 0
  sourceHeight: 0

  constructor: (@world, imageUrl) ->
    @image = new RaY.Engine.SpriteImage(imageUrl)

  drawImage: (sourceX, sourceY, destinationX, destinationY) ->
    if @image.ready
      @world.context.drawImage(@image.image, sourceX, sourceY, @sourceWidth, @sourceHeight, destinationX, destinationY, @width, @height)
      
