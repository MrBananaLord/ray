class RaY.Models.Goal extends RaY.Engine.Entity
  collidable: false
  gravitable: false
  sourceWidth: 100
  sourceHeight: 100
  width: 30
  height: 30
  redHeroFinished: false
  yellowHeroFinished: false
  
  constructor: (@world, @x, @y) ->
    super(@world, "images/game/food.png")
    @bindToEvents()
    
  bindToEvents: ->
    super
    @bind @world, "checkCollisionsWith", (element) =>
      if this != element and this.collidesWith(element)
        @manageCollisionWith(element)
    
  render: ->
    super
    @resetGoalObjectives() unless @world.currentLevel.completed
    
  manageCollisionWith: (element) ->
    @redHeroFinished = true if element instanceof RaY.Models.RedHero
    @yellowHeroFinished = true if element instanceof RaY.Models.YellowHero
    @world.trigger("levelCompleted") if @redHeroFinished and @yellowHeroFinished
    
  resetGoalObjectives: ->
    @yellowHeroFinished = false
    @redHeroFinished = false
