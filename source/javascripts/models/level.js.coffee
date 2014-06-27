class RaY.Models.Level extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  resetCount: 0
  completed: false
  elements: []
  
  constructor: (@world, @name) ->
    @data = _.find RaY.Data.Levels, (level) ->
      level.name == name
    @bindToEvents()
    @buildScene()

  bindToEvents: ->
    @bind @world, "levelCompleted", () => @levelCompleted()
    @bind @world, "keyUp", (name) =>
      @resetScene() if name == "r"
    
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
    return @yellowHero
  
  createRedHero: ->
    @redHero = new RaY.Models.RedHero(@world)
    @redHero.x = @data.redHero.x
    @redHero.y = @data.redHero.y
    return @redHero
  
  createGoal: ->
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
    @redHero = @redHero.destroy()
    @yellowHero = @yellowHero.destroy()
    
    for element in @elements
      element.destroy()
    @elements = []
    
    @background = @background.destroy()
    
  resetScene: ->
    @destroyScene()
    @resetCount++
    @buildScene()
 
  destroy: ->
    @destroyScene()
    @purge()
    
  createElement = (klass, attributes) ->
    tmpObj = Object.create(klass.prototype)
    klass.apply(tmpObj, attributes)
    tmpObj

