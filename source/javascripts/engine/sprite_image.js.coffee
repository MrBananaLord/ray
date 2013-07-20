class RaY.Engine.SpriteImage
  ready: false

  constructor: (@url) ->
    image = new Image
    image.src = @url
    image.onload = => @ready = true
    @image = image
