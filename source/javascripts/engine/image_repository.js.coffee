class RaY.Engine.ImageRepository extends RaY.Engine.Module
  images: []
  ready: false

  constructor: ->
    for file in RaY.Data.Images
      @images.push(new RaY.Engine.SpriteImage(file))

  isReady: =>
    return @ready if @ready
    @ready = true
    @ready = (@ready && image.isReady()) for image in @images
    return @ready

  find: (name) =>
    _.findWhere(@images, { name: name }) || _.first(@images)
