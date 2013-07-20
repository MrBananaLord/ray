class RaY.Engine.Sprite
  sourceX: 0
  sourceY: 0
  sourceWidth: 0
  sourceHeight: 0
  destinationX: 0
  destinationY: 0
  destinationWidth: 0
  destinationHeight: 0
  x: 0
  y: 0
  collidable: false

  constructor: (@world, imageUrl) ->
    @image = new SpriteImage(imageUrl)

  render: (sourceX, sourceY, destinationX, destinationY) ->
    if @image.ready
      @world.context.drawImage(@image.image, sourceX, sourceY, @sourceWidth, @sourceHeight, destinationX, destinationY, @destinationWidth, @destinationHeight)

  update: ->
