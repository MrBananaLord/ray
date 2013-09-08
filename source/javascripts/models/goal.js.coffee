class RaY.Models.Goal extends RaY.Engine.Rectangle
  collidable: false
  gravitable: false
  fillStyle: "#9f5"
  width: 20
  height: 30
  redHeroFinished: false
  yellowHeroFinished: false
  
  constructor: (@world, @x, @y) ->
    super(@world)
    @bindToEvents()
    
  bindToEvents: ->
    super
    @world.bind "checkCollisionsWith", (element) =>
      if this != element and this.collidesWith(element)
        @manageCollisionWith(element)
    
  render: ->
    super
    @resetGoalObjectives() unless @world.currentLevel.complited
    
  manageCollisionWith: (element) ->
    @redHeroFinished = true if element instanceof RaY.Models.RedHero
    @yellowHeroFinished = true if element instanceof RaY.Models.YellowHero
    @world.trigger("levelComplited") if @redHeroFinished and @yellowHeroFinished
    
  resetGoalObjectives: ->
    @yellowHeroFinished = false
    @redHeroFinished = false
