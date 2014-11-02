class RaY.Engine.SoundRepository extends RaY.Engine.Module
  sounds: []
  ready: false
  
  constructor: ->
    for file in RaY.Data.Sounds
      @sounds.push(new RaY.Engine.SoundPool(file.name, file.poolSize))
  
  isReady: =>
    return @ready if @ready
    @ready = true
    @ready = @ready && sound.isReady() for sound in @sounds
    return @ready
