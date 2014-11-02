class RaY.Engine.SoundPool extends RaY.Engine.Module
  counter: 0
  pool: {}
  ready: false
  
  constructor: (filePath, @size = 5) ->
    _(@size).times (i) =>
      audio = new Audio(filePath)
      #audio.volume = .12;
      audio.load()
      @pool[i] = audio
  
  currentSound: => @pool[@counter]
  
  play: =>
    if (@currentSound().currentTime == 0 || @currentSound().ended)
      @currentSound().play()
    @counter = (@counter + 1) % @size
  
  isReady: =>
    return @ready if @ready
    @ready = true
    @ready = @ready && audio.readyState for audio in @pool
    return @ready
