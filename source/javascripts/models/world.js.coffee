class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 1
  levels: [
    "Tutorial 1",
    "Xtreme",
    "The End"
  ]
  
  constructor: ->
    @context = @createCanvasAndGetContext()
    @imageRepository = new RaY.Engine.ImageRepository
    @soundRepository = new RaY.Engine.SoundRepository
    @currentLevel = new RaY.Models.Level(this, "Tutorial 1")
    @gui = new RaY.Models.Gui(this)
    @bind this, "levelCompleted", () => @proceedToNextLevel()
    
  proceedToNextLevel: ->
    if nextLevelName = @levels[@levels.indexOf(@currentLevel.name) + 1]
      @currentLevel.destroy()
      @currentLevel = new RaY.Models.Level(this, nextLevelName)
      @gui.resetScene()
      
  createCanvasAndGetContext: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: ->
    @trigger("update") if @isReady()
  render: ->
    @trigger("render") if @isReady()
  
  isReady: -> @imageRepository.isReady() and @soundRepository.isReady()
  sounds: (name) -> @soundRepository.find(name)
  images: (name) -> @imageRepository.find(name)
