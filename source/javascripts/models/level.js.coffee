class RaY.Models.Level extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  completed: false
  elements: []
  
  constructor: (@world) ->
    @bindToEvents()
    @buildScene()

  bindToEvents: ->
    @bind @world, "levelCompleted", () => @levelCompleted()
    
  levelCompleted: ->
    unless @completed
      @completed = true
      @elements = []
      @message = new RaY.Models.Message(@world)
      
  createBackground: ->
    background = new RaY.Engine.Rectangle(@world)
    background.fillStyle = "#234"
    background.width = 640
    background.height = 480
    @background = background
    return background
  
  createYellowHero: ->
    hero = new RaY.Models.YellowHero(@world)
    hero.x = 5
    hero.y = 470
    @yellowHero = hero
    return hero
  
  createRedHero: ->
    hero = new RaY.Models.RedHero(@world)
    hero.x = 5
    hero.y = 280
    @redHero = hero
    return hero
  
  createGoal: ->
    goal = new RaY.Models.Goal(@world)
    goal.x = 610
    goal.y = 350
    @elements.push(goal)
    return goal
    
  buildScene: ->
    @createBackground()
    @createYellowHero()
    @createRedHero()
    @createGoal()
    
    # sides
    @elements.push new RaY.Models.Platform(@world, 0, 0, 5, 480, "#fff")
    @elements.push new RaY.Models.Platform(@world, 0, 0, 640, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 635, 0, 5, 480, "#fff")
    @elements.push new RaY.Models.Platform(@world, 0, 475, 640, 5, "#fff")
    
    # platforms
    @elements.push new RaY.Models.Platform(@world, 50, 435, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 125, 375, 200, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 5, 300, 95, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 190, 380, 5, 95, "#fff")
    @elements.push new RaY.Models.Platform(@world, 105, 260, 70, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 100, 260, 5, 20, "#fff")
    @elements.push new RaY.Models.Platform(@world, 170, 180, 5, 80, "#fff")
    @elements.push new RaY.Models.Platform(@world, 70, 220, 20, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 35, 140, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 5, 105, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 45, 70, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 175, 180, 60, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 320, 180, 5, 195, "#fff")
    @elements.push new RaY.Models.Platform(@world, 290, 180, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 250, 70, 5, 70, "#fff")
    @elements.push new RaY.Models.Platform(@world, 290, 160, 5, 60, "#fff")
    @elements.push new RaY.Models.Platform(@world, 365, 180, 5, 125, "#fff")
    @elements.push new RaY.Models.Platform(@world, 405, 180, 5, 125, "#fff")
    @elements.push new RaY.Models.Platform(@world, 325, 340, 125, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 410, 180, 225, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 145, 70, 225, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 420, 70, 215, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 580, 380, 55, 5, "#fff")
    
    @elements.push new RaY.Models.Platform(@world, 295, 355, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 235, 325, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 175, 295, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 235, 265, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 175, 235, 25, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 235, 215, 55, 5, "#fff")
    
    # boxes
    @elements.push new RaY.Models.Box(@world, 70, 200, "#e92")
    @elements.push new RaY.Models.Box(@world, 70, 50, "#e92")
    @elements.push new RaY.Models.Box(@world, 70, 120, "#e92")
    @elements.push new RaY.Models.Box(@world, 170, 160, "#e92")
    @elements.push new RaY.Models.Box(@world, 550, 160, "#e92")
    @elements.push new RaY.Models.Box(@world, 280, 50, "#e92")
    @elements.push new RaY.Models.Box(@world, 470, 50, "#e92")
    
    @elements.push new RaY.Models.Box(@world, 510, 455, "#e92")
    @elements.push new RaY.Models.Box(@world, 530, 455, "#e92")
    @elements.push new RaY.Models.Box(@world, 510, 434, "#e92")
    @elements.push new RaY.Models.Box(@world, 530, 434, "#e92")
    
  resetScene: ->
    delete @redHero.unbind()
    delete @yellowHero.unbind()
    
    for element in @elements  
      element.unbind()
    @elements = []
    
    delete @background.unbind()
    
    @buildScene()
    
