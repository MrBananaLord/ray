class RaY.Models.Gui extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  resetCount: 1
  completed: false
  elements: []
  level: 1
  hidden: false

  constructor: (@world) ->
    @bindToEvents()
    @buildScene()

  bindToEvents: ->
    @bind @world, "levelCompleted", () => @levelCompleted()
    @bind @world, "resetGui", () => @reset()
    @bind @world, "hideGui", () => @hide()
    @bind @world, "showGui", () => @show()

  levelCompleted: ->
    unless @world.currentLevel.completed
      @level += 1
      @resetScene()

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
      fillStyle: "#cc35cc", contentX: 7, contentY: 22, textFillStyle: "#fff"
    })
    return @resetCounter

  buildScene: ->
    unless @hidden
      @createBackground()
      @createResetCounter()

  destroyScene: ->
    unless @hidden
      @resetCounter = @resetCounter.destroy()
      @background = @background.destroy()

  resetScene: ->
    @destroyScene()
    @buildScene()

  reset: ->
    @resetCount++
    @resetScene()

  destroy: ->
    @destroyScene()
    @purge()

  hide: ->
    @destroyScene()
    @hidden = true

  show: ->
    @hidden = false
    @buildScene()
