class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 1
  
  constructor: ->
    @context = @createCanvasAndGetContext()
    @currentLevel = new RaY.Models.Level(this)
    
  createCanvasAndGetContext: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: -> @trigger("update")
  render: -> @trigger("render")
  
  currentLevelComplited: ->
    @currentLevel and @currentLevel.complited == true
