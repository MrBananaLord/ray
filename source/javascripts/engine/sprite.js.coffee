class RaY.Engine.Sprite extends RaY.Engine.Module
  sourceX: 0
  sourceY: 0
  sourceWidth: 0
  sourceHeight: 0
  destinationX: 0
  destinationY: 0
  width: 0
  height: 0
  x: 0
  y: 0

  constructor: (@world, imageUrl) ->
    @image = new RaY.Engine.SpriteImage(imageUrl)

  drawImage: (sourceX, sourceY, destinationX, destinationY) ->
    if @image.ready
      @world.context.drawImage(@image.image, sourceX, sourceY, @sourceWidth, @sourceHeight, destinationX, destinationY, @width, @height)
      
