class RaY.Models.Gui extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  resetCount: 0
  completed: false
  elements: []
  level: 1
  
  constructor: (@world) ->
    @bindToEvents()
    @buildScene()

  bindToEvents: ->
    @bind @world, "levelCompleted", () => @levelCompleted()
    @bind @world, "keyUp", (name) =>
      @resetScene() if name == "r"
    
  levelCompleted: ->
    @level += 1
      
  createBackground: ->
    @background = new RaY.Engine.Rectangle(@world, {
      fillStyle: "#23cccc",
      width: 146 + @resetCountLength(),
      height: 38,
      x: 2, y: 2
    })
    return @background
  
  resetCountLength: -> 
   ((@resetCount).toString().length - 1) * 7
   
  resetCounterMessage: ->
    "Lvl: " + @level + ".  Attempts: " + @resetCount
  
  createResetCounter: ->
    @resetCounter = new RaY.Models.Message(@world, @resetCounterMessage(), {
      x: 5, y: 5, height: 32, width: 140 + @resetCountLength(),
      fillStyle: "#cc35cc", contentX: 11, contentY: 27, textFillStyle: "#fff"
    })
    return @resetCounter
  
  buildScene: ->
    @createBackground()
    @createResetCounter()
  
  destroyScene: ->
    @resetCounter = @resetCounter.destroy()
    @background = @background.destroy()
    
  resetScene: ->
    @destroyScene()
    @resetCount++
    @buildScene()
 
  destroy: ->
    @destroyScene()
    @purge()
