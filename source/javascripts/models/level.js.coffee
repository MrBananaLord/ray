class RaY.Models.Level extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  completed: false
  elements: []

  constructor: (@world, @name) ->
    @data = _.find RaY.Data.Levels, (level) => level.name == @name
    @bindToEvents()
    @world.trigger("hideGui") if @data.gui == "hidden"
    @buildScene()

  bindToEvents: ->
    @bind @world, "levelCompleted", () => @levelCompleted()
    @bind @world, "keyUp", (name) =>
      if name == "r"
        @resetScene()
        @world.trigger("resetGui")

  levelCompleted: ->
    unless @completed
      @completed = true

  createBackground: ->
    @background = new RaY.Engine.Rectangle(@world)
    @background.fillStyle = @data.background.fillStyle
    @background.width = @data.background.width
    @background.height = @data.background.height
    return @background

  createYellowHero: ->
    @yellowHero = new RaY.Models.YellowHero(@world)
    @yellowHero.x = @data.yellowHero.x
    @yellowHero.y = @data.yellowHero.y
    if @data.yellowHero.firstAnimation
      @yellowHero.activateAnimation(@data.yellowHero.firstAnimation)
    return @yellowHero

  createRedHero: ->
    @redHero = new RaY.Models.RedHero(@world)
    @redHero.x = @data.redHero.x
    @redHero.y = @data.redHero.y
    if @data.redHero.firstAnimation
      @redHero.activateAnimation(@data.redHero.firstAnimation)
    return @redHero

  createGoal: ->
    if @data.goal
      goal = new RaY.Models.Goal(@world)
      goal.x = @data.goal.x
      goal.y = @data.goal.y
      @elements.push(goal)
      return goal

  buildScene: ->
    @createBackground()
    @createGoal()
    @createYellowHero()
    @createRedHero()
    for element in @data.elements
      for subelement in element.elements
        @elements.push(createElement(element.klass, [@world].concat(subelement)))

  destroyScene: ->
    @redHero.destroy()
    @yellowHero.destroy()

    for element in @elements
      element.destroy()
    @elements = []

    @background.destroy()

  resetScene: ->
    @destroyScene()
    @buildScene()

  destroy: ->
    @destroyScene()
    @purge()

  createElement = (klass, attributes) ->
    tmpObj = Object.create(klass.prototype)
    klass.apply(tmpObj, attributes)
    tmpObj
