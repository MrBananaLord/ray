class RaY.Engine.SpriteImage
  ready: false

  constructor: (@url) ->
    image = new Image
    image.src = @url
    image.onload = => @ready = true
    @image = image
    @name = _.first(_.last(@url.split("/")).split("."))
    
  isReady: -> @ready
  
