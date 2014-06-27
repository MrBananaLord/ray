class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 1
  levels: [
    "Tutorial 1"
    "Xtreme"
  ]
  
  constructor: ->
    @context = @createCanvasAndGetContext()
    @currentLevel = new RaY.Models.Level(this, "Tutorial 1")
    
    @bind this, "levelCompleted", () => @proceedToNextLevel()
    
  proceedToNextLevel: ->
    if nextLevelName = @levels[@levels.indexOf(@currentLevel.name) + 1]
      console.debug nextLevelName
      @currentLevel.destroy()
      @currentLevel = new RaY.Models.Level(this, nextLevelName)
    
    if @currentLevel.completed
      @message = new RaY.Models.Message(this)
      
  createCanvasAndGetContext: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: -> @trigger("update")
  render: -> @trigger("render")  
