class RaY.Models.Level extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  elements: []
  
  constructor: (@world) ->
    @background = @createBackground()
    @yellowHero = @createYellowHero()
    @redHero = @createRedHero()
    @buildScene()
    
  createBackground: ->
    background = new RaY.Engine.Rectangle(@world)
    background.fillStyle = "#234"
    background.width = 640
    background.height = 480
    @elements.push(background)
    return background
  
  createYellowHero: ->
    hero = new RaY.Models.YellowHero(@world)
    hero.x = 100
    hero.y = 100
    @elements.push(hero)
    return hero
  
  createRedHero: ->
    hero = new RaY.Models.RedHero(@world)
    hero.x = 10
    hero.y = 10
    @elements.push(hero)
    return hero
    
  buildScene: ->
    left = new RaY.Engine.Rectangle(@world)
    left.collidable = true
    left.fillStyle = "yellow"
    left.height = 10
    left.width = 30
    left.y = 1
    left.x = 211
    left.gravitable = true
    @left = left
    @elements.push(left)
    
    right = new RaY.Engine.Rectangle(@world)
    right.fillStyle = "red"
    right.collidable = true
    right.height = 10
    right.width = 30
    right.y = 105
    right.x = 100
    right.gravitable = true
    @right = right
    @elements.push(right)
    
    top = new RaY.Engine.Rectangle(@world)
    top.fillStyle = "blue"
    top.collidable = true
    top.height = 50
    top.width = 30
    top.y = -100
    top.x = 370
    top.gravitable = true
    @top = top
    @elements.push(top)
    
    bottom = new RaY.Engine.Rectangle(@world)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 220
    bottom.x = 100
    @bottom = bottom
    @elements.push(bottom)
    
    bottom = new RaY.Engine.Rectangle(@world)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 320
    bottom.x = 10
    @bottom2 = bottom
    @elements.push(bottom)
    
    bottom = new RaY.Engine.Rectangle(@world)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 270
    bottom.x = 60
    @bottom3 = bottom
    @elements.push(bottom)
    
    
